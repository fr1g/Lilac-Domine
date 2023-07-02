package com.lilac.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lilac.mapper.UserMapper;
import com.lilac.pojo.TransactionLog;
import com.lilac.pojo.User;
import com.lilac.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    @Override
    public PageInfo<User> listAllUsers(Integer pageNum) {
        PageHelper.startPage(pageNum, 6);
        List<User> list = userMapper.listAllUsers();
        PageInfo<User> page = new PageInfo<>(list, 5);
        return page;
    }

    @Override
    public User getUserByUserName(String userName) {
        return userMapper.getUserByUserName(userName);
    }

    @Override
    public User getUserByUid(Integer id) {
        return userMapper.getUserById(id);
    }

    @Override
    public User getUserByUserNameAndPassword(String userName, String password) {
        return userMapper.getUserByUserNameAndPassword(userName, password);
    }

    @Override
    public Integer getUserStatusByUserName(String userName) {
        return userMapper.getUserByUserName(userName).getStatus();
    }

    @Override
    public BigDecimal getUserBalance(String userName){
        return userMapper.getUserBalance(userName);
    }

    @Override
    public void updateUserStatusById(Integer id, Integer status) {
        userMapper.updateUserStatusById(id, status);
    }

    @Override
    public void updateUserBalanceById(Integer id, BigDecimal balance) {
        userMapper.updateUserBalanceById(id, balance);
    }

    @Override
    public void updateUserBalanceByUserName(String name, BigDecimal balance) {
        userMapper.updateUserBalanceByUserName(name, balance);
    }
}