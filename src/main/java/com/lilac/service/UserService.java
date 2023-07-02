package com.lilac.service;

import com.github.pagehelper.PageInfo;
import com.lilac.pojo.User;

import java.math.BigDecimal;
import java.util.List;

public interface UserService {

    void insertUser(User user);

    PageInfo<User> listAllUsers(Integer page);

    User getUserByUserName(String userName);

    User getUserByUid(Integer id);

    User getUserByUserNameAndPassword(String userName, String password);

    Integer getUserStatusByUserName(String userName);

    BigDecimal getUserBalance(String userName);

    void updateUserStatusById(Integer id, Integer status);

    void updateUserBalanceById(Integer id, BigDecimal balance);

    void updateUserBalanceByUserName(String name, BigDecimal balance);
}
