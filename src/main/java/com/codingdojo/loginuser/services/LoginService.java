package com.codingdojo.loginuser.services;

import com.codingdojo.loginuser.models.LoginUser;
import com.codingdojo.loginuser.models.User;
import com.codingdojo.loginuser.repositores.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

@Service
public class LoginService {

@Autowired
UserRepository userRepository;

    public User register(User newUser, BindingResult result) {
        if (userRepository.findByEmail(newUser.getEmail()) != null) {
            result.rejectValue("email", "Unique", "This email is already registered");
        }
        //verify is the password is the same with the confirmation password
        if (!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches", "Password and confirm password must match");
        }
        if (result.hasErrors()) {
            return null;
        } else {
            //hash the password
            String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
            newUser.setPassword(hashed);
            return userRepository.save(newUser);
        }
    }

    public User login(LoginUser newLogin, BindingResult result) {
        User user = userRepository.findByEmail(newLogin.getEmail());
        if (user == null) {
            result.rejectValue("email", "Invalid", "This email is not registered");
            return null;
        }
        if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
            result.rejectValue("password", "Invalid", "Incorrect password");
        }
        return result.hasErrors() ? null : user;
    }
}

