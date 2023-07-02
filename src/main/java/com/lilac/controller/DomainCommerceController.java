package com.lilac.controller;

import com.lilac.helper.PresetDomainPerMonthPriceHelper;
import com.lilac.helper.PriceCalculateHelper;
import com.lilac.pojo.Domain;
import com.lilac.pojo.User;
import com.lilac.service.IDomainQuerySrv;
import com.lilac.service.ITransactionLogSrv;
import com.lilac.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/domain")
public class DomainCommerceController {

    DomainControlHelper _dhc;

    @Autowired
    IDomainQuerySrv domains;

    @Autowired
    UserService users;

    @Autowired
    ITransactionLogSrv trans;


    @PostMapping("/buy")
    public ResponseEntity<String> BuyDomain(@RequestBody String body, HttpSession session){
        if(session.getAttribute("USER_SESSION") == null)
            return ResponseEntity.badRequest().body("not_log_in");

        try {
            boolean isAdminAction;
            User thisone = (User)session.getAttribute("USER_SESSION");
            switch (thisone.getStatus()){
                case 2:
                    isAdminAction = true;
                    break;
                case 0:
                    return ResponseEntity.badRequest().body("user_banned");
                default:
                    isAdminAction = false;
                    break;
            }
            // domain, year, month
            String[] _prep = body.split(",");
            String _domain = _prep[0];
            int year = Integer.parseInt(_prep[1]), month = Integer.parseInt(_prep[1]);

            _dhc = new DomainControlHelper();
            String _ret = _dhc.CreateDomainProc(trans, domains, users,
                    thisone.getUserName(),
                    _domain,
                    PresetDomainPerMonthPriceHelper.GetPrePrice(_domain),
                    ((year * 12) + month),
                    "pur: " + isAdminAction,
                    isAdminAction );

            return ResponseEntity.ok(_ret);

        }catch (Exception ex) {
            return ResponseEntity.status(505).body("err-except.");
        }
    }

    @PostMapping("/swar")
    public ResponseEntity<String> SwitchAutoRenew(@RequestBody String body, HttpSession session){
        if(session.getAttribute("USER_SESSION") == null)
            return ResponseEntity.badRequest().body("not_log_in");
        try { // body: domain-id, need verify.
            User thisone = (User)session.getAttribute("USER_SESSION");
            DomainControlHelper _dhc = new DomainControlHelper();
            if(_dhc.IsDomainBelongsTo(thisone.getUserName(), Integer.parseInt(body), domains))
            {
                _dhc.Swar(Integer.parseInt(body), domains);
            }
            else return ResponseEntity.status(204).body("not-own");

            return ResponseEntity.ok("switched.");
        }catch (Exception ex) {
            return ResponseEntity.status(505).body("err-except.");
        }
    }

    @PostMapping("/get-price") // template
    public ResponseEntity<String> GetPrice(@RequestBody String body){

        try { // body pattern: domain(full)$year$month
            String[] _body = body.split("\\$");
            int months = (Integer.parseInt(_body[1]) * 12) + Integer.parseInt(_body[2]);
            return ResponseEntity.ok(PriceCalculateHelper.CalcCostByMonth(months, _body[0]) + "");
        }catch (Exception ex) {
            ex.printStackTrace();
            return ResponseEntity.status(500).body("none");
        }
    }

    @PostMapping("/re")
    public ResponseEntity<String> Renew(@RequestBody String body, HttpSession session){
        if(session.getAttribute("USER_SESSION") == null)
            return ResponseEntity.badRequest().body("not_log_in");
        try {
            // pattern: domainname$year$month
            String[] _body = body.split("\\$");
            String _toDomain = _body[0];
            User thisone = (User)session.getAttribute("USER_SESSION");
            Domain thisdomain = domains.QuerySingleDomain(_toDomain);

            _dhc = new DomainControlHelper();
            Thread.sleep(300);
            if(!_dhc.IsDomainBelongsTo( thisone.getUserName(),
                    thisdomain.getId(),
                    domains
            )) return ResponseEntity.status(556).body("not_yours");

            int months = (Integer.parseInt(_body[1]) * 12) + Integer.parseInt(_body[2]);

            return ResponseEntity.ok(
                    _dhc.RenewDomainProc(_toDomain, thisone, domains, trans, users,
                            thisone.getStatus() == 2, months,
                            (thisdomain.getPrice().doubleValue() * months)   )
            );
        }catch (Exception ex) {
            ex.printStackTrace();
            return ResponseEntity.status(505).body("err-except.");
        }
    }

    @PostMapping("/rea")
    public ResponseEntity<String> RenewAdmin(@RequestBody String body, HttpSession session){
        // only need to send: domain id.
        if(session.getAttribute("USER_SESSION") == null
                || ((User)session.getAttribute("USER_SESSION")).getStatus() != 2)
            return ResponseEntity.badRequest().body("not_log_in");
        return Renew(domains.QuerySingleDomainById(Integer.parseInt(body))
                                  .getDomainName() + "$0$1", session);
    }

    @PostMapping("/ask")
    public ResponseEntity<String> AskDomainStatus(@RequestBody String body){
        try { // body: domain itself; resp: isAble(0[able],1[unable]),price(doubleString)
            Domain _qd = domains.QuerySingleDomain(body);
            if(_qd == null) {
                double price = PresetDomainPerMonthPriceHelper.GetPrePrice(body);
                return ResponseEntity.ok(0 + "," + price);
            }else return ResponseEntity.ok("1,1");
        }catch (Exception ex) {
            return ResponseEntity.status(505).body("err-except.");
        }
    }



    @PostMapping("/ugh") // template
    public ResponseEntity<String> Ugh(@RequestBody String body, HttpSession session){
        if(session.getAttribute("USER_SESSION") == null)
            return ResponseEntity.badRequest().body("not_log_in");
        try {
            return ResponseEntity.ok("");
        }catch (Exception ex) {
            return ResponseEntity.status(505).body("err-except.");
        }
    }

}
