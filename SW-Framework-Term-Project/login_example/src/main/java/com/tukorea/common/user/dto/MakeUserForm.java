package com.tukorea.common.user.dto;


public class MakeUserForm {

    private String jwt;
    private int userId;

    public MakeUserForm(String jwt, int userId) {
        this.jwt = jwt;
        this.userId = userId;
    }

    public MakeUserForm() {

    }


    public String getJwt() {
        return jwt;
    }

    public void setJwt(String jwt) {
        this.jwt = jwt;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }


}
