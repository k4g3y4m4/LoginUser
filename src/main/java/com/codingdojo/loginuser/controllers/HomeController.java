package com.codingdojo.loginuser.controllers;

import com.codingdojo.loginuser.models.LoginUser;
import com.codingdojo.loginuser.models.User;
import com.codingdojo.loginuser.services.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class HomeController {

    @Autowired
    private LoginService loginService;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        if(session.getAttribute("user") == null) {
            return "redirect:/";
        }
        model.addAttribute("user", session.getAttribute("user"));
        return "dashboard.jsp";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User user,
                           BindingResult result, Model model, HttpSession session) {


        loginService.register(user, result);
        System.out.println(user.information());
        if (result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        session.setAttribute("user", user);
        return "redirect:/dashboard";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser loginUser,
                        BindingResult result, Model model, HttpSession session) {

        User user = loginService.login(loginUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        session.setAttribute("user", user);
        return "redirect:/dashboard";
    }

}
