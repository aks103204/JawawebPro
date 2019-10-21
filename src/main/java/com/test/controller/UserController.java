package com.test.controller;

import com.test.model.User;
import com.test.service.UserImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.*;


@RestController
@CrossOrigin
@RequestMapping(name = "user",value = {"/user"})
public class UserController {

    @Autowired
    private UserImpl service;
        @RequestMapping(value = "/login")
    public ResponseEntity<Void> login(@RequestBody User user) {
           boolean flag=service.login(user);
        if(flag){
            return new ResponseEntity<Void>(HttpStatus.OK);
        }else{
            return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
        }
    }
    @RequestMapping(value = "/register/{username}/{password}")
    public ResponseEntity<Void> register(@PathVariable("username") String username,@PathVariable("password") String password) {
            boolean flag=service.register(username, password);
        System.out.println(flag);
        if(flag){
            return new ResponseEntity<Void>(HttpStatus.OK);
        }else{
            return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
        }
    }
}
