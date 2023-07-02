package com.lilac.service;

import com.github.pagehelper.PageInfo;
import com.lilac.pojo.Domain;
import com.lilac.pojo.DomainInfo;
import com.lilac.pojo.TransactionLog;
import com.lilac.pojo.User;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

public interface IDomainQuerySrv {

    void AddDomain(Domain domain); //

    void RemoveDomain(String name);

    void UpdateDomain(Domain domain);

    void UpdateDomainStatusById(Integer id, Integer stat);

    void UpdateDomainNameById(Integer id, String name);

    void RenewDomain(Integer domainId, Date newExp);

//    Integer CountAboutExpireDomains(Integer uid);
//
//    Integer CountAutorenewDomains(Integer uid);

//    String QueryUserDomainsCount(String userName);

    Domain QuerySingleDomain(String domain);

    Domain QuerySingleDomainById(Integer id);

    List<Domain> QueryAllDomainOnce();

    List<Domain> QueryAllDomain(Integer start);

    List<Domain> QueryUserDomain(String userName, int start);

    List<Domain> QueryUserDomainOnce(String userName);

    User QueryDomainActivatingOwner(String domain);

    PageInfo<DomainInfo> ListAllRegisteredDomains(Integer pageNum);


    PageInfo<Domain> ListOwnDomains(User thisone, Integer pageNum);

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

}
