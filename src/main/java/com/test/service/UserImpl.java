package com.test.service;

import com.test.mapper.UserMapper;
import com.test.model.User;
import com.test.model.UserExample;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import java.util.List;

@Service("userService")
public class UserImpl {

    @Autowired
    UserMapper udao;

    public int queryUserByUserName(String username) {
        UserExample userExample =new UserExample();
        userExample.createCriteria().andUsernameEqualTo(username);
        return udao.selectByExample(userExample).get(0).getUserid();
    }
    public boolean login(User user){
        UserExample userExample =new UserExample();
        userExample.createCriteria().andPasswordEqualTo(user.getPassword()).andUsernameEqualTo(user.getUsername());
        return udao.selectByExample(userExample).size()>0;
    }
    public boolean register(String username,String password){
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);
        boolean flag;
        if(!login(user)){
            udao.insert(user);
            flag=true;
        }else {
            flag=false;
        }
        return flag;
    }
}
