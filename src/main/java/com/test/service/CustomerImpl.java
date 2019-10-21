package com.test.service;


import com.test.mapper.CustomerMapper;
import com.test.model.Customer;
import com.test.model.CustomerExample;
import com.test.model.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("customerService")
public class CustomerImpl {
    @Autowired
    CustomerMapper cdao;

    public boolean insertProduct(String name,String address,String phone,int userid){
        Customer customer = new Customer();
        customer.setName(name);
        customer.setAddress(address);
        customer.setPhone(phone);
        customer.setUserid(userid);
        int n=cdao.insert(customer);
        System.out.println(n);
        return  true;
    }
    public List<Customer> queryAllbyId(int userid){
        CustomerExample customerExample =new CustomerExample();
        customerExample.createCriteria().andUseridEqualTo(userid);
        return cdao.selectByExample(customerExample);
    }
    public boolean deleteById(int id){
        CustomerExample customerExample =new CustomerExample();
        customerExample.createCriteria().andIdEqualTo(id);
        boolean flag;
       if(cdao.selectByPrimaryKey(id).getId()==id){
          cdao.deleteByExample(customerExample);
          flag=true;
       }else {
           flag=false;
       }
       return flag;
    }
    public boolean updateById(int id,String name,String address,String phone,int userid){
        CustomerExample customerExample =new CustomerExample();
        customerExample.createCriteria().andIdEqualTo(id);
        boolean flag;
        Customer customer=new Customer();
        customer.setId(id);
        customer.setName(name);
        customer.setAddress(address);
        customer.setPhone(phone);
        customer.setUserid(userid);
        if(cdao.selectByPrimaryKey(id).getId()==id){
            cdao.updateByExample(customer,customerExample);
            flag=true;
        }else {
            flag=false;
        }
        return flag;
    }

    public List<Customer> queryLike(int userid, String name) {

        return cdao.selectLikeByName(userid, name);
    }
}
