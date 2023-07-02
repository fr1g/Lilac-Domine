package com.lilac.service;

import com.github.pagehelper.PageInfo;
import com.lilac.pojo.TransactionLog;

public interface TradeService {
    PageInfo<TransactionLog> listAllTransactionLogs(Integer pageNum);

}
