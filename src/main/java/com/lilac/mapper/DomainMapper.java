package com.lilac.mapper;

import com.lilac.pojo.Domain;
import com.lilac.pojo.TransactionLog;
import com.lilac.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
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

public interface DomainMapper {
    @Select("select * from domain limit #{start},6")
    List<Domain> QueryAllDomain(Integer start);

    @Select("select * from domain")
    List<Domain> QueryAllDomainOnce();

    @Select("select * from transaction_log where order_type='buy' ") //
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "purchaser_id", property = "purchaser",
                    one = @One(select = "com.lilac.mapper.UserMapper.getUserById")),
            @Result(column = "domain_id", property = "domain",
                    //one = @One(select = "com.lilac.mapper.DomainMapper.getActDomainById")), // ! need those stat 2
                    one = @One(select = "com.lilac.mapper.DomainMapper.getDomainById")), // ! was
            @Result(column = "order_type", property = "orderType"),
            @Result(column = "detail", property = "detail"),
            @Result(column = "create_time", property = "createTime"),
            @Result(column = "update_time", property = "updateTime")
    })
    List<TransactionLog> QueryAllActivateDomainLogsOnce();

//    @Select("select count(*) from domain " +
//            "join transaction_log on domain.id = transaction_log.domain_id " +
//            "join user on user.id = transaction_log.purchaser_id " +
//            "where user.user_name=#{userName} " +
//            "and domain.status=2 and transaction_log.order_type='buy' ")
//    Integer QueryUserDomainCount(String userName);

//    @Select("select count(*) from domain " +
//            "join transaction_log on domain.id = transaction_log.domain_id " +
//            "join user on user.id = transaction_log.purchaser_id " +
//            "where user.id=#{uid} and domain.id=#{did} " +
//            "and domain.status=2 and transaction_log.order_type='buy' ")
//    Domain QueryOneUserDomain(@Param("uid")Integer uid, @Param("did")Integer did);

    @Select("select * from domain " +
            "join transaction_log tl on domain.id = tl.domain_id " +
            "join user u on u.id = tl.purchaser_id " +
            "where user_name=#{userName} " +
            "and domain.status=2 and tl.order_type='buy' " +
            //"and tl.update_time >= domain.update_time " +
            "limit #{start},5")
    List<Domain> QueryUserDomain(@Param("userName") String userName, @Param("start") Integer start);

    @Select("select * from domain " +
            "join transaction_log on domain.id = transaction_log.domain_id " +
            "join user on user.id = transaction_log.purchaser_id " +
            "where user_name=#{userName} and domain.status=2 and transaction_log.order_type='buy' ")
    List<Domain> QueryUserDomainOnce(@Param("userName") String userName);

    @Select("select * from domain where id=#{id}")
    Domain getDomainById(Integer id);

    @Select("select * from domain where id=#{id} and status = 2")
    Domain getActDomainById(Integer id);

    @Select("select * from domain where domain_name like " +
            "concat(#{domainName,jdbcType=VARCHAR},'%') and status=2")
    Domain QuerySingleDomain(String domainName);

    @Select("select * from domain where id = #{id}")
    Domain QuerySingleDomainById(Integer id);

    @Select("select * from domain where domain_name = #{name}")
    Domain QueryAnySingleDomainByName(String name);

    @Select("select * from domain where expire_time < current_timestamp()")
    List<Domain> GetAllExpireDomainOnce();

//    @Select(("select count(1) from domain join transaction_log on domain.id = transaction_log.domain_id join user on user.id = transaction_log.purchaser_id where expire_time <= (select date_add(now(), interval 30 day)) and transaction_log.purchaser_id = #{uid} and domain.status = 2 and transaction_log.order_type = 'buy' and 1=1"))
    //@Select("select count(*) from (select expire_time from domain join transaction_log on domain.id = transaction_log.domain_id join user on user.id = transaction_log.purchaser_id where expire_time <= (select date_add(now(), interval 30 day)) and transaction_log.purchaser_id = #{uid} and domain.status = 2 and transaction_log.order_type = 'buy' and 1=1)")
//    Integer CountExpireDomains(@Param("uid")Integer uid);
//
////    @Select(("select count(1) from domain join transaction_log on domain.id = transaction_log.domain_id join user on user.id = transaction_log.purchaser_id where domain.domain_name like '%/#' and transaction_log.purchaser_id = #{uid} and domain.status = 2 and transaction_log.order_type = 'buy' and 1=1"))
//    //@Select(("select count(1) from (select domain_name from domain join transaction_log on domain.id = transaction_log.domain_id join user on user.id = transaction_log.purchaser_id where domain.domain_name like '%/#' and transaction_log.purchaser_id = #{uid} and domain.status = 2 and transaction_log.order_type = 'buy' and 1=1)"))
//    Integer CountAutoRenews(@Param("uid")Integer uid);

    @Select("select * from domain where expire_time < current_timestamp() limit #{start},6")
    List<Domain> GetAllExpireDomain(Integer start);

    @Select("select * from user " +
            "join transaction_log on user.id = transaction_log.purchaser_id " +
            "join domain on domain.id = transaction_log.domain_id " +
            "where domain.domain_name like concat(#{domain,jdbcType=VARCHAR},'%') and domain.status=2 and transaction_log.order_type='buy' ")
    User QueryDomainActOwner(String domain);

    @Delete("delete from domain where domain_name like concat(#{domainName,jdbcType=VARCHAR},'%')")
    void DeleteDomain(String domainName);

    @Insert("insert into domain(domain_name, price, info, status, expire_time, create_time, " +
            "update_time) " +
            "value(#{domainName}, #{price}, #{info}, #{status}, #{expireTime}, #{createTime}, " +
            "#{updateTime})") //,jdbcType=DATETIME
    void AddNewDomain(Domain domain);

    @Update("update domain set price=#{price}, info=#{info}, status=#{status}, " +
            "expire_time=#{expireTime}, update_time=#{updateTime} " +
            "where domain_name=#{domainName}, status=2, id=#{id}")
    void UpdateDomain(Domain domain);

    @Update("update domain set status=#{stat} where id=#{did}")
    void UpdateDomainStatus(@Param("did")Integer did, @Param("stat")Integer stat);

    @Update("update domain set expire_time=#{newTime} where id=#{did} and status=2")
    void RenewDomain(@Param("did")Integer domainID,
                     @Param("newTime")String newExp);

    @Update("update domain set domain_name=#{name} where id=#{did}")
    void UpdateDomainName(@Param("did")Integer id, @Param("name")String name);
}
