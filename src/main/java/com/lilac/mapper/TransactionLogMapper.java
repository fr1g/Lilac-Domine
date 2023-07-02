package com.lilac.mapper;

import com.lilac.pojo.TransactionLog;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface TransactionLogMapper {
    @Select("select * from transaction_log")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "purchaser_id", property = "purchaser",
                    one = @One(select = "com.lilac.mapper.UserMapper.getUserById")),
            @Result(column = "domain_id", property = "domain",
                    one = @One(select = "com.lilac.mapper.DomainMapper.getDomainById")),
            @Result(column = "order_type", property = "orderType"),
            @Result(column = "detail", property = "detail"),
            @Result(column = "create_time", property = "createTime"),
            @Result(column = "update_time", property = "updateTime")
    })
    List<TransactionLog> listAllTransactionLogs();

    @Update("update transaction_log " +
            "set order_type='once ${auid} X', " + // TODO "once (someone) X"
            "purchaser_id=0 " +
            "where order_type='buy' " +
            "and domain_id=#{did,jdbcType=INTEGER} " +
            "and purchaser_id=#{uid,jdbcType=INTEGER}") //...? //2
    void UpdateExpiredDomainLog(@Param("auid")Integer auid,
                                @Param("did")Integer did,
                                @Param("uid")Integer uid);

    @Insert("insert into transaction_log(purchaser_id, domain_id, order_type, detail) " +
            "value(#{uid}, #{did}, 'remove', 'once: ${uid} *')") //1
    void InsertAfterDomainExpired(@Param("did")Integer domainId,
                                  @Param("uid")Integer userId);

    // admin-renew renew buy(proc. after new domain record)

    @Insert("insert into transaction_log(purchaser_id, domain_id, order_type, detail)" +
            "value(#{uid}, #{did}, #{ot}, #{de})")
    void InsertNewLog(@Param("uid")Integer uid,
                      @Param("did")Integer did,
                      @Param("ot")String orderType,
                      @Param("de")String detail);

    @Insert("insert into transaction_log(purchaser_id, domain_id, order_type, detail) " +
            "value(0, #{did}, 'renew', '#{det}')")
    void InsertRenewLog(@Param("did")Integer did, @Param("det")String detail);
}
