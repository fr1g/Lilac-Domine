package com.lilac.service.impl;

import com.lilac.mapper.TransactionLogMapper;
import com.lilac.service.ITransactionLogSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TransactionLogSrv implements ITransactionLogSrv {

    @Autowired
    private TransactionLogMapper _tm;

    @Override
    public void UpdateExpiredDomain(Integer auid, Integer did, Integer uid) {
        _tm.UpdateExpiredDomainLog(auid, did, uid);
    }

    @Override
    public void InsertAfterExpiredDomain(Integer did, Integer uid) {
        _tm.InsertAfterDomainExpired(did, uid);
    }

    @Override
    public void InsertNewLog(Integer uid, Integer did, String type, String detail) {
        _tm.InsertNewLog(uid, did, type, detail);
    }
}
