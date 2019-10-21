package com.test.controller;


import com.test.model.Customer;
import com.test.service.CustomerImpl;
import com.test.service.UserImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping(name = "customer",value = {"/customer"})
public class CustomerController {
    static {
        System.out.println("进入controller");
    }
    @Autowired
    CustomerImpl cservice;
    @Autowired
    UserImpl uservice;
    @RequestMapping(value = "/insert/{name}/{address}/{phone}/{username}")
    public ResponseEntity<Void> register(@PathVariable("name") String name,
                                         @PathVariable("address")String address,
                                         @PathVariable("phone")String phone,
                                         @PathVariable("username")String username) {
        int userid=uservice.queryUserByUserName(username);
        boolean flag=cservice.insertProduct(name, address,phone,userid);
        System.out.println(flag);
        if(flag){
            return new ResponseEntity<Void>(HttpStatus.OK);
        }else{
            return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping(value = "/queryAll/{username}")
    public ResponseEntity<List<Customer>> queryAll(@PathVariable("username")String username){
        int userid=uservice.queryUserByUserName(username);
       List<Customer> list=cservice.queryAllbyId(userid);
        return new ResponseEntity<List<Customer>>(list,HttpStatus.OK);
    }
    @RequestMapping(value = "/queryLike/{pname}/{username}")
    public ResponseEntity<List<Customer>> queryLike(@PathVariable("pname")String pname,
                                                    @PathVariable("username")String username){
        int userid=uservice.queryUserByUserName(username);

        List<Customer> list=cservice.queryLike(userid,pname);
        if(list.size()>=1){
            return new ResponseEntity<List<Customer>>(list,HttpStatus.OK);
        }else {
            return new ResponseEntity<List<Customer>>(HttpStatus.NOT_FOUND);
        }

    }

    @RequestMapping(value = "/delete/{id}")
    public ResponseEntity<Void> deleteById(@PathVariable("id")String id){
        boolean flag=cservice.deleteById(Integer.parseInt(id));
        if(flag){
            return new ResponseEntity<Void>(HttpStatus.OK);
        }else {
            return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping(value = "/update/{id}/{name}/{address}/{phone}/{username}")
    public ResponseEntity<Void> updateById(@PathVariable("id")String id,
                                           @PathVariable("name")String name,
                                           @PathVariable("address")String address,
                                           @PathVariable("phone")String phone,
                                           @PathVariable("username") String username){
        int userid=uservice.queryUserByUserName(username);
        boolean flag=cservice.updateById(Integer.parseInt(id),name,address,phone,userid);
        if(flag){
            return new ResponseEntity<Void>(HttpStatus.OK);
        }else {
            return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
        }
    }
}
