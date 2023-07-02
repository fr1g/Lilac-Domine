package com.lilac.controller;

import com.lilac.helper.DateTimeHelper;
import com.lilac.pojo.Domain;
import com.lilac.pojo.User;
import com.lilac.service.IDomainQuerySrv;
import com.lilac.service.UserService;
import com.lilac.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping(value = "/user", produces = "text/plain;charset=UTF-8")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private IDomainQuerySrv _domquer;

    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody User user) {
        if (userService.getUserByUserName(user.getUserName()) != null) {
            return ResponseEntity.badRequest().body("用户名已存在");
        }
        user.setPassword(Md5Util.encrypt(user.getPassword()));
        try {
            user.setStatus(1);
            user.setBalance(BigDecimal.ZERO);
            userService.insertUser(user);
            return ResponseEntity.ok("注册成功");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("系统错误");
        }
    }

    @PostMapping("login")
    public ResponseEntity<String> login(@RequestBody User user, HttpSession session) {
        user.setPassword(Md5Util.encrypt(user.getPassword()));
        try {
            User queriedUser = userService.getUserByUserNameAndPassword(user.getUserName(),
                    user.getPassword());
            System.out.println(queriedUser);
            if (queriedUser == null) return ResponseEntity.badRequest().body("用户名或密码错误");
            if (Objects.equals(queriedUser.getStatus(), 0))
                return ResponseEntity.badRequest().body("用户已被封禁");
            session.setAttribute("USER_SESSION", queriedUser);
            return ResponseEntity.ok("登录成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("系统错误");
        }
    }

    @GetMapping("logoff")
    public ResponseEntity<String> logoff(HttpSession session, HttpServletResponse servletResponse) {
        try {
            session.invalidate();
            //            session.removeAttribute("USER_SESSION");
            servletResponse.sendRedirect("/");
            return ResponseEntity.ok("退出成功");
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("系统错误");
        }
    }

    @PostMapping("updfund")
    public ResponseEntity<String> addFund(@RequestBody String body, HttpSession session) {
        if (session.getAttribute("USER_SESSION") != null) {
            User thisone = ((User) session.getAttribute("USER_SESSION"));
            String[] bodys = body.split("@");
            if(bodys[1].isEmpty()) return ResponseEntity.badRequest().body("useless_hexahook");
            userService.updateUserBalanceById(thisone.getId(),
                    (BigDecimal.valueOf(Double.parseDouble(bodys[0]) + Double.parseDouble(userService.getUserBalance(thisone.getUserName()).toString()))));
            return ResponseEntity.ok("done! now balance is:" +
                    userService.getUserBalance(((User) session.getAttribute("USER_SESSION")).getUserName()));
        } else return ResponseEntity.badRequest().body("not_log_in");
    }

    @PostMapping("getfund")
    public  ResponseEntity<String> GetUserFund(HttpSession session){
        if (session.getAttribute("USER_SESSION") != null) {
            User thisone = ((User) session.getAttribute("USER_SESSION"));
            return ResponseEntity.ok(userService.getUserBalance(thisone.getUserName()).toString());
        } else return ResponseEntity.badRequest().body("not_log_in");
    }

    @PostMapping("/startstage")
    public ResponseEntity<String> StartStageInfoGet(HttpSession session){
        if (session.getAttribute("USER_SESSION") != null) {
            try{
                User thisone = ((User) session.getAttribute("USER_SESSION"));
                // return renews$expires$total
                String _nxn = "";
                short renews = 0, ab_exps = 0, total = 0;
                List<Domain> domains = _domquer.QueryUserDomainOnce(thisone.getUserName());
                for (Domain dom : domains) {
                    total++;
                    if(dom.getDomainName().contains("#")) renews++;
                    System.out.println(DateTimeHelper.NowDaySpan(dom.getExpireTime()));
                    if(Integer.parseInt(DateTimeHelper.NowDaySpan(dom.getExpireTime()).replace(" nf", "")) <= 30) ab_exps++;
                }
                _nxn = renews + "$" + ab_exps + "$" + total;
              //_nxn = _domquer.CountAutorenewDomains(thisone.getId()) + "$" + _domquer.CountAboutExpireDomains(thisone.getId());
                return ResponseEntity.ok(_nxn);

            }catch (Exception ex){
                System.out.println("##################");
                ex.printStackTrace();
                System.err.println(ex.toString());
                System.out.println("&&&&&&&&&&&&&&&&&&");
                return ResponseEntity.status(505).body(ex.toString()); }
        } else return ResponseEntity.badRequest().body("not_log_in");
    }
}
