package com.lilac.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lilac.mapper.DomainMapper;
import com.lilac.pojo.Domain;
import com.lilac.pojo.DomainInfo;
import com.lilac.pojo.TransactionLog;
import com.lilac.pojo.User;
import com.lilac.service.IDomainQuerySrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class DomainQuerySrv implements IDomainQuerySrv {

    @Autowired
    private DomainMapper _dm;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
    public void AddDomain(Domain domain){
        _dm.AddNewDomain(domain);
    }

    @Override
    public void UpdateDomain(Domain domain){
        _dm.UpdateDomain(domain);
    }

    @Override
    public void UpdateDomainStatusById(Integer id, Integer stat) {
        _dm.UpdateDomainStatus(id, stat);
    }

    @Override
    public void UpdateDomainNameById(Integer id, String name) {
        _dm.UpdateDomainName(id, name);
    }

    @Override
    public void RenewDomain(Integer domainId, Date newExp) {
        _dm.RenewDomain(domainId, sdf.format(newExp));
    }

//    @Override
//    public String QueryUserDomainsCount(String userName) {
//        return _dm.QueryUserDomainCount(userName).toString();
//    }

    @Override
    public void RemoveDomain(String name){
        _dm.DeleteDomain(name);
    }

//    @Override
//    public Integer CountAboutExpireDomains(Integer uid){
//        System.out.println("###### uid: " + uid);
//        return _dm.CountExpireDomains(uid);
//    }
//
//    @Override
//    public Integer CountAutorenewDomains(Integer uid){
//        System.out.println("###### uid: " + uid);
//        return _dm.CountAutoRenews(uid);
//    }

    @Override
    public Domain QuerySingleDomain(String name){
        return _dm.QuerySingleDomain(name);
    }

    public Domain QuerySingleDomainById(Integer id){
        return _dm.QuerySingleDomainById(id);
    }

    @Override
    public List<Domain> QueryAllDomainOnce() {
        return _dm.QueryAllDomainOnce();
    }

    @Override
    public List<Domain> QueryAllDomain(Integer start) {
        return _dm.QueryAllDomain(PaginationCalcHelper(start));
    }

    @Override
    public List<Domain> QueryUserDomain(String userName, int start){
        return _dm.QueryUserDomain(userName, PaginationCalcHelper(start));
    }

    @Override
    public User QueryDomainActivatingOwner(String domain){
        return _dm.QueryDomainActOwner(domain);
    }


    @Override
    public List<Domain> QueryUserDomainOnce(String userName) {
        return _dm.QueryUserDomainOnce(userName);
    }

    private int PaginationCalcHelper(int origna){
        // for "Every page 5 records" only.
        if (origna <= 1) return 0;
        else return 5 * (origna - 1);
    }

    @Override
    public PageInfo<DomainInfo> ListAllRegisteredDomains(Integer pageNum) {
        try {
            PageHelper.startPage(pageNum, 6);
            List<TransactionLog> list = _dm.QueryAllActivateDomainLogsOnce();
            List<DomainInfo> _list = new ArrayList<>();
            for (TransactionLog tl : list) {
                _list.add(tl.ToDomainInfo());
            }
            PageInfo<DomainInfo> page = new PageInfo<>(_list, 5);
            return page;
        }catch ( Exception ex) { ex.printStackTrace();}
        return null;
    }
    @Override
    public PageInfo<Domain> ListOwnDomains(User thisone, Integer pageNum) {
        PageHelper.startPage(pageNum, 6);
        List<Domain> list = _dm.QueryUserDomainOnce(thisone.getUserName());
        PageInfo<Domain> page = new PageInfo<>(list, 5);
        return page;
    }

}
