package com.lilac.controller;


import com.lilac.helper.DateTimeHelper;
import com.lilac.helper.PriceCalculateHelper;
import com.lilac.pojo.Domain;
import com.lilac.pojo.TransactionLog;
import com.lilac.pojo.User;
import com.lilac.service.IDomainQuerySrv;
import com.lilac.service.ITransactionLogSrv;
import com.lilac.service.UserService;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class DomainControlHelper {
    // admin renew and user renew
    // user switch auto renew (user controller)
    // function for newdayevent: remove
    // create new domain record und admin create domain record

    public String CreateDomainProc(ITransactionLogSrv trans,
                                        IDomainQuerySrv domain,
                                        UserService user,
                                        String ownerName,
                                        String domainName,
                                        double shouldPrice,
                                        int months,
                                        String info, boolean isAdminAct) throws InterruptedException {
        if(user.getUserByUserName(ownerName) == null) return "user-not-found";
        // check if domain already exist
        if(domain.QuerySingleDomain(domainName) != null
        || domain.QuerySingleDomain(domainName + "#") != null) // hey, maybe we should add "%" after a disabled domain
            if(domain.QuerySingleDomain(domainName).getStatus() == 2
            || domain.QuerySingleDomain(domainName + "#").getStatus() == 2) return "already";
            else domain.UpdateDomainNameById(domain.QuerySingleDomain(domainName).getId(),
                                            domainName + "%");
            // if exist an activated domain, return already.
            // else, if exist a disabled domain, change its name to recover pattern
        // then decide balance of user
        double shouldPay = PriceCalculateHelper.CalcCostByMonth(months, shouldPrice);
        if(!isAdminAct) {
            double newBal = Double.parseDouble(user.getUserBalance(ownerName).toString())
                    - shouldPay;
            if(newBal < 0) return "balance-not-enough";
            else user.updateUserBalanceByUserName(ownerName, BigDecimal.valueOf(newBal));
        }

        // may create a new domain record
        Date _da = new Date();
        domain.AddDomain(new Domain(null,
                                    domainName,
                                    BigDecimal.valueOf(shouldPrice),
                                    info, 2,
                                    DateTimeHelper.AddMonthsResult(_da, months) , _da, _da));
        // create a transaction
        Thread.sleep(500); // ?
//        new TransactionLog(null, user.getUserByUserName(ownerName), domain.QuerySingleDomain(domainName), "buy", );
        trans.InsertNewLog(
                user.getUserByUserName(ownerName).getId(),
                domain.QuerySingleDomain(domainName).getId(),
                            "buy", "~$" + shouldPay);

        return "done";
    }

    public String RenewDomainProc(String domainName,
                                    User owner,
                                   IDomainQuerySrv domain,
                                   ITransactionLogSrv trans,
                                   UserService user,
                                   boolean isAdminAct,
                                   int months,
                                  double shouldPay) throws InterruptedException {
        // what to check before...

        if(domain.QueryDomainActivatingOwner(domainName) == null) return "record-empty";
        Domain thisdom = domain.QuerySingleDomain(domainName);
        if(!isAdminAct) {

            double newBal = user.getUserBalance(owner.getUserName()).doubleValue()
                    - shouldPay;
            if(newBal < 0.0d) return "balance-not-enough";
            else user.updateUserBalanceByUserName(owner.getUserName(), BigDecimal.valueOf(newBal));
        }

        // refresh expire time at domain
        domain.RenewDomain(thisdom.getId(),
                            DateTimeHelper.AddMonthsResult(
                                                            thisdom.getExpireTime(),
                                                            months));
        // add new record of transaction log
        Thread.sleep(500); // ?
//        new TransactionLog(null, user.getUserByUserName(ownerName), domain.QuerySingleDomain(domainName), "buy", );
        trans.InsertNewLog(
                owner.getId(),
                domain.QuerySingleDomain(domainName).getId(),
                "renew", "~$" + shouldPay);

        return "done";
    }

    public String RemoveDomainProc(String domainName,
                                   IDomainQuerySrv domain,
                                   ITransactionLogSrv trans){
        // first make sure the domain is activated

        // if not, do:
        // find original transaction log and set its order-type to once (user) *, set its owner to 0
        // set domain stat to 1,
        int did = domain.QuerySingleDomain(domainName).getId(), uid = domain.QueryDomainActivatingOwner(domainName).getId();
        trans.UpdateExpiredDomain(uid, did, uid);
        domain.UpdateDomainStatusById(did, 1);

        return "err";
    }

    public boolean IsDomainBelongsTo(String uname, Integer did, IDomainQuerySrv domains){
        try {
            List<Domain> comp = domains.QueryUserDomainOnce(uname);
            for(Domain d : comp){
                if (d.getId() == did) return true;
            }
        }catch (Exception ex){
            return false;
        }
        return false;
    }

    public void Swar(Integer did, IDomainQuerySrv domains){
        try {
            Domain _modify = domains.QuerySingleDomainById(did);
            if(_modify.getDomainName().contains("#"))
                _modify.setDomainName(_modify.getDomainName().replace("#", ""));
            else
                _modify.setDomainName(_modify.getDomainName() + "#");

            domains.UpdateDomainNameById(_modify.getId(), _modify.getDomainName());

        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    public boolean IsDomainExpire(String domainName, IDomainQuerySrv domain){
        Domain _do = domain.QuerySingleDomain(domainName);
        return Integer.parseInt(DateTimeHelper.NowDaySpan(_do.getExpireTime()).replace(" nf", "")) >= 0;
    }


}
