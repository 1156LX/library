package com.lixin.library.controller;

import com.lixin.library.domain.User;
import com.lixin.library.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

@Controller
public class loginController {
    @Autowired
    private UserService userService ;
    private Logger logger;

    @RequestMapping ("/dologin")
    @ResponseBody
    public int doLogin(HttpServletRequest request , HttpSession session ,HttpServletResponse response ) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userService.userLogin(username, password);
        if (null == user) {
            return 0;
        } else {
            request.getSession().setAttribute("user", user);
            return 1;
        }
    }
}
