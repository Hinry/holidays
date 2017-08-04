package com.holidays.controllers;

import com.holidays.entity.User;
import com.holidays.entity.UserRole;
import com.holidays.service.UserService;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

@Controller
public class UserController {

    private final UserService userService;
    private final MessageSource messageSource;

    public UserController(UserService userService, MessageSource messageSource) {
        this.userService = userService;
        this.messageSource = messageSource;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registrationPage(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        request.setCharacterEncoding(StandardCharsets.UTF_8.name());
        response.setCharacterEncoding(StandardCharsets.UTF_8.name());
        User user = new User();
        model.addAttribute("user", user);
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registrationUser(@Valid User user, BindingResult result,
                                   ModelMap model) {

        if (result.hasErrors()) {
            return "/registration";
        }

        if (!userService.isUserUnique(user.getLogin())) {
            FieldError ssoError = new FieldError("user", "login", messageSource.getMessage("non.unique.login", new String[]{user.getLogin()}, Locale.getDefault()));
            result.addError(ssoError);
            return "/registration";
        }
        Set<UserRole> roles = new HashSet<>();
        roles.add(initializeProfile());
        user.setUserRoles(roles);
        userService.addUser(user);

        model.addAttribute("success", "Пользователь " + user.getFirstName() + " " + user.getLastName() + " успешно зарегестрирован.");
        return "index";
    }

    @ModelAttribute("role")
    public UserRole initializeProfile() {
        return userService.findRoleById(2);
    }
}
