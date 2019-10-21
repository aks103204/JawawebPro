package com.test.mapper;

import com.test.model.Customer;
import com.test.model.User;
import com.test.service.CustomerImpl;
import com.test.service.UserImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "classpath:applicationContext.xml"})
public class test {

    @Autowired
    private UserImpl userService;
    @Autowired
    private CustomerImpl customerService;

    @Test
    public void testqueryCustomerbyid(){
        int id =1;
        List<Customer> list=customerService.queryAllbyId(1);
        for(Customer c:list){
            System.out.println(c.getName());
        }
    }
    @Test
    public void testQueryUserByUserId() {
        String userId = "aks123";
        int n = userService.queryUserByUserName(userId);
        System.out.println(n);
    }
    @Test
    public void insert(){
        userService.register("123","123");
    }
    @Test
    public void update(){
        System.out.println(customerService.updateById(12,"橘子","asd","12121",1));
    }
    @Test
    public void queryLike(){
        List<Customer> l = customerService.queryLike(1,"笔");
        System.out.println(l.size());
        System.out.println(l.size());
        System.out.println(l.size());
        System.out.println(l.size());
        for(Customer customer :l){
            System.out.println(customer.getName());
        }
    }
}