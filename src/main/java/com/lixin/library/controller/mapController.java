package com.lixin.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mapController {

    @RequestMapping("/userLogin")
    public String login(){return "login";}

    @RequestMapping("/reg")
    public String reg(){return "user/reg";}

    @RequestMapping("/userUpdate")
    public String update(){return "user/update";}

    @RequestMapping("/userChangePassword")
    public String changePassword(){return "user/changePassword";}

    @RequestMapping("/userIndex")
    public String userIndex(){return "user/index";}


}
