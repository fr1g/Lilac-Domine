package com.lilac.controller;

import com.github.pagehelper.PageInfo;
import com.lilac.helper.DateTimeHelper;
import com.lilac.pojo.Domain;
import com.lilac.pojo.DomainInfo;
import com.lilac.pojo.TransactionLog;
import com.lilac.pojo.User;
import com.lilac.service.IDomainQuerySrv;
import com.lilac.service.ITransactionLogSrv;
import com.lilac.service.TradeService;
import com.lilac.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/admin-cont")
public class AdminContentController {


    @Autowired
    IDomainQuerySrv _dqs;

    @Autowired
    ITransactionLogSrv _tls;

    @Autowired
    TradeService _ts;

    @Autowired
    UserService _us;

    @PostMapping("/ban")
    public ResponseEntity<String> SwitchBanUser(@RequestBody String body, HttpSession session){
        if(session.getAttribute("USER_SESSION") == null)
            return ResponseEntity.status(502).body("not-log-in");

        if(((User)session.getAttribute("USER_SESSION")).getStatus() != 2)
            return ResponseEntity.status(502).body("Unpermischonewarden");
        else{
            try{
                //body: uid
                int uid = Integer.parseInt(body);
                User thisone = _us.getUserByUid(uid);
                if (thisone.getStatus() == 2)
                    return ResponseEntity.status(204).body("Use_DB_Console_to_remove_admin.");
                if(thisone.getStatus() == 0) //...
                    _us.updateUserStatusById(uid, 1);
                else
                    _us.updateUserStatusById(uid, 0); // ban
                return ResponseEntity.status(200).body("done");

            }catch (Exception ex){
                ex.printStackTrace();
                return ResponseEntity.status(500).body("exception");
            }
        }
    }

    @GetMapping("/domains/page/{pageNum}")
    public String ListAllRegisteredDomains(Model model, @PathVariable("pageNum") Integer pageNum, HttpSession session) {
        PageInfo<DomainInfo> page = _dqs.ListAllRegisteredDomains(pageNum);
        System.out.println(page);
        model.addAttribute("page", page);
//        return "/Components/trademanage";
        return "/Components/frame-list-admin-domain";
    }

    @GetMapping("/trade/page/{pageNum}")
    public String listAllTransactionLogs(Model model, @PathVariable("pageNum") Integer pageNum) {
        PageInfo<TransactionLog> page = _ts.listAllTransactionLogs(pageNum);
        System.out.println(page);
        model.addAttribute("page", page);
//        return "/Components/trademanage";
        return "/Components/frame-list-admin-trades";
    }

    @GetMapping("/user/page/{pageNum}")
    public String ListAllUsers(Model model, @PathVariable("pageNum") Integer pageNum) {
        PageInfo<User> page = _us.listAllUsers(pageNum);
        System.out.println(page);
        model.addAttribute("page", page);
//        return "/Components/trademanage";
        return "/Components/frame-list-admin-users";
    }


    @PostMapping("/remove-domain")
    public ResponseEntity<String> AdminDeleteDomain(@RequestBody String body, HttpSession session){
            if((User)(session.getAttribute("USER_SESSION")) != null
                    && ((User)(session.getAttribute("USER_SESSION"))).getStatus() == 2){
                try{ // body is // domain_id$pur_id
                    Integer did = Integer.parseInt(body.split("\\$")[0]),
                            uid = Integer.parseInt(body.split("\\$")[1]); //
                    // domain status: 1,
                    _dqs.UpdateDomainStatusById(did, 1);
                    // translog detail: once uid* :: getlog: select * from ...
                    // that translog purchaser.id = 0
                    _tls.UpdateExpiredDomain(uid, did, uid);
                    _tls.InsertAfterExpiredDomain(did, uid);
                    // new day event invokable
                    return ResponseEntity.ok("done");
                }catch (Exception ex){
                    ex.printStackTrace();
                    return ResponseEntity.status(500).body("error");
                }
            }
            else return ResponseEntity.badRequest().body("not_log_in");

            //return ResponseEntity.status(505).body("unknown");
        }

    @PostMapping("/renew-domain")
    public ResponseEntity<String> AdminRenewDomain(@RequestBody String body, HttpSession session) {
        if ((User) (session.getAttribute("USER_SESSION")) != null
                && ((User) (session.getAttribute("USER_SESSION"))).getStatus() == 2) {
            try{  //body: did$uid$type(0:year,1:month)$length
                Integer domain = Integer.parseInt(body.split("\\$")[0]),
                        uid = Integer.parseInt(body.split("\\$")[1]),
                        type = Integer.parseInt(body.split("\\$")[2]),
                        length = Integer.parseInt(body.split("\\$")[3]);
                // renew procedure:
                // get current
                // log renew info
                // update domain
                Domain _dom = _dqs.QuerySingleDomainById(domain);
                if(type==0) length *= 12;
                _dom.setExpireTime(DateTimeHelper.AddMonthsResult(_dom.getExpireTime(), length));
                _dqs.UpdateDomain(_dom);
                _tls.InsertNewLog(domain, uid, "renew_admin", "admin renew domain");

                return ResponseEntity.ok("done");
            }catch (Exception ex){return ResponseEntity.status(500).body("error");}
        }else return ResponseEntity.badRequest().body("not_log_in");
    }
}
