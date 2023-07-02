package com.lilac.service.test;

import com.lilac.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class TestUserService {

    @Autowired
    private UserService userService;

    @Test
    public void testChangeUserStatus() {
        System.out.println("test!!!!!!!!!!!");
        userService.updateUserStatusById(userService.getUserByUserName("usertest").getId(), 1);
    }
}
