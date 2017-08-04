package com.holidays.entity;

public enum UserRoleType {

    USER("USER"),
    DBA("DBA"),
    ADMIN("ADMIN");

    String userRoleType;

    UserRoleType(String userProfileType){
        this.userRoleType = userProfileType;
    }

    public String getUserProfileType(){
        return userRoleType;
    }
}
