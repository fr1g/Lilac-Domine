package com.lilac.service;

public interface ITransactionLogSrv {
    /* Requirements:
    * Update: Set ownership to 0 while Set order_type to once + this.userid
    * Insert: Add new log with type
    * Select: select * from transaction_log join domain at transaction_log.domain_id = domain.id where order_type='buy' and domain.status=1 and purchaser_id = ? and domain_id = ?
    */
    void UpdateExpiredDomain(Integer auid, Integer did, Integer uid);
    void InsertAfterExpiredDomain(Integer did, Integer uid);

    void InsertNewLog(Integer uid, Integer did, String type, String detail);
}
