package com.holidays.config;

import com.holidays.entity.UserRole;
import com.holidays.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class ConvertUserRole implements Converter<Object, UserRole> {

    private final UserService userService;

    @Autowired
    public ConvertUserRole(UserService userService) {
        this.userService = userService;
    }

    public UserRole convert(Object element) {
        Integer id = Integer.parseInt((String) element);
        return userService.findById(id);
    }
}
