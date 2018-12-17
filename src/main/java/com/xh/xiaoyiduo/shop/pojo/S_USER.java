package com.xh.xiaoyiduo.shop.pojo;

import java.util.HashSet;
import java.util.Set;

public class S_USER {
    private String userId;

    private String studentNo;

    private String nickname;

    private String password;

    private String realName;

    private String sex;

    private String email;

    private String phone;

    private String dormitoryAddress;

    private Set<S_USER_ROLES> roles = new HashSet<>();

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo == null ? null : studentNo.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getDormitoryAddress() {
        return dormitoryAddress;
    }

    public void setDormitoryAddress(String dormitoryAddress) {
        this.dormitoryAddress = dormitoryAddress == null ? null : dormitoryAddress.trim();
    }

    public Set<S_USER_ROLES> getRoles() {
        return roles;
    }

    public void setRoles(Set<S_USER_ROLES> roles) {
        this.roles = roles;
    }
}