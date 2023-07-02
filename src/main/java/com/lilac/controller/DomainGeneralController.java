package com.lilac.controller;

import com.alibaba.fastjson2.JSON;
import com.github.pagehelper.PageInfo;
import com.lilac.pojo.Domain;
import com.lilac.pojo.User;
import com.lilac.service.IDomainQuerySrv;
import com.lilac.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/query", produces = "text/plain;charset=UTF-8")
public class DomainGeneralController {
    @Autowired
    private IDomainQuerySrv _dQuery;

    @Autowired
    private UserService _us;

    /*Needs:
     *
     * Query Domains of a user
     * Query All Domains Registered (once and pagination)
     * Query Single Domain
     * Remove Registered Domain
     * Add New Domain Register
     * Update Single Domain Record
     *
     */
    // phrase: single_description&another_description&key$value


    @PostMapping("/own")
    public ResponseEntity<String> GetUserDomains(@RequestBody String body, HttpSession session){
        // for this time, body should only query by phrase:
        // number
        if(session.getAttribute("USER_SESSION") != null){
            try {
                List<Domain> domains = _dQuery.QueryUserDomain(
                        ((User)session.getAttribute("USER_SESSION")).getUserName(),
                        (Integer.parseInt(body))
                );
                String RespondBody = JSON.toJSONString(domains);
                return ResponseEntity.ok(RespondBody);
            }catch (Exception ex){
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("系统错误");
            }
        }else return ResponseEntity.badRequest().body("not_log_in");

    }

    @GetMapping("/own-domain/{pageNum}") // /query/own-domain/...
    public String ListAllRegisteredDomains(Model model, @PathVariable("pageNum") Integer pageNum, HttpSession session) {
        if(session.getAttribute("USER_SESSION") == null) return null;
        PageInfo<Domain> page = _dQuery.ListOwnDomains((User)session.getAttribute("USER_SESSION"), pageNum);
        System.out.println(page);
        model.addAttribute("page", page);
        return "/Components/frame-list-manage-domains";
    }


    @PostMapping("/all")
    public ResponseEntity<String> GetAllDomains(@RequestBody String body, HttpSession session){
        // for this time, body should only query by phrase:
        // number
        if(session.getAttribute("USER_SESSION") != null &&
          ((User)session.getAttribute("USER_SESSION")).getStatus() == 2){
            try {
                List<Domain> domains = _dQuery.QueryAllDomain(Integer.parseInt(body));
                String RespondBody = JSON.toJSONString(domains);
                return ResponseEntity.ok(RespondBody);
            }catch (Exception ex){
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("系统错误");
            }
        }else return ResponseEntity.badRequest().body("not_log_in_properly");
    }

    @PostMapping("/disable") // useless? AdminContentController/(remove-domain)
    public ResponseEntity<String> DisableDomain(@RequestBody String body, HttpSession session){
        return ResponseEntity.badRequest().body("not_log_in_properly");
    }

    /*
    * Functions Need:
    * Update: Switch Renew (add or delete # after domain name)
    * Update: Update Renew Date (TransLogTime Later Than DomainUpdateTime.)
    * Update:
    * Add: Register New Domain Record
    * Drop: Delete Out-of-date Record
    * Query: User Domain
    * Query: All Domains only for Admins.
    *
    */


    //    @GetMapping("/owncount")
//    public ResponseEntity<String> GetUserDomainsOwn(HttpSession session){
//        if(session.getAttribute("USER_SESSION") != null){
//            try {
//                return ResponseEntity.ok(_dQuery.QueryUserDomainsCount(((User)session.getAttribute("USER_SESSION")).getUserName()));
//            }catch (Exception ex) {
//                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("系统错误");
//            }
//        }else return ResponseEntity.badRequest().body("not_log_in");
//    }
//
//    @GetMapping("/undercount")
//    public ResponseEntity<String> GetUserDomainsUnderExpireCount(HttpSession session){
//        if(session.getAttribute("USER_SESSION") != null){
//            try {
//                return ResponseEntity.ok(_dQuery.QueryUserDomainsCount(((User)session.getAttribute("USER_SESSION")).getUserName()));
//            }catch (Exception ex) {
//                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("系统错误");
//            }
//        }else return ResponseEntity.badRequest().body("not_log_in");
//    }
}
