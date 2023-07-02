package com.lilac.mapper;

import com.lilac.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.math.BigDecimal;
import java.util.List;

public interface UserMapper {

    @Insert("insert into user(user_name, password, email, balance, status) values(#{userName}, " +
            "#{password}, " +
            "#{email}, #{balance}, #{status})")
    void insertUser(User user);

    @Select("select * from user")
    List<User> listAllUsers();

    @Select("select * from user where id=#{id}")
    User getUserById(Integer id);

    @Select("select * from user where user_name=#{username}")
    User getUserByUserName(String userName);

    @Select("select balance from user where user_name=#{username}")
    BigDecimal getUserBalance(@Param("username") String userName); // ?

    @Select("select * from user where user_name=#{username} and password=#{password}")
    User getUserByUserNameAndPassword(@Param("username") String userName,
                                      @Param("password") String password);

    @Update("update user set status=#{status} where id=#{id}")
    void updateUserStatusById(@Param("id") Integer id, @Param("status") Integer status);

    @Update("update user set balance=#{balance} where id=#{id}")
    void updateUserBalanceById(@Param("id") Integer id, @Param("balance") BigDecimal balance);

    @Update("update user set balance=#{balance} where user_name=#{name}")
    void updateUserBalanceByUserName(@Param("name") String name, @Param("balance") BigDecimal balance);
}
