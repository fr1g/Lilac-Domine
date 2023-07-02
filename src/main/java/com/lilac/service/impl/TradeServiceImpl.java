package com.lilac.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lilac.mapper.TransactionLogMapper;
import com.lilac.pojo.TransactionLog;
import com.lilac.service.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TradeServiceImpl implements TradeService {

    @Autowired
    TransactionLogMapper transactionLogMapper;

    @Override
    public PageInfo<TransactionLog> listAllTransactionLogs(Integer pageNum) {
        PageHelper.startPage(pageNum, 6);
        List<TransactionLog> list = transactionLogMapper.listAllTransactionLogs();
        PageInfo<TransactionLog> page = new PageInfo<>(list, 5);
        return page;
    }
}
