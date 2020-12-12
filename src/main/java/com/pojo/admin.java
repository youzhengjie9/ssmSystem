package com.pojo;

public class admin {

    private String id;
    private String password;
    private authority authority;

    public admin() {
    }

    public admin(String id, String password, com.pojo.authority authority) {
        this.id = id;
        this.password = password;
        this.authority = authority;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public com.pojo.authority getAuthority() {
        return authority;
    }

    public void setAuthority(com.pojo.authority authority) {
        this.authority = authority;
    }


    @Override
    public String toString() {
        return "admin{" +
                "id='" + id + '\'' +
                ", password='" + password + '\'' +
                ", authority=" + authority +
                '}';
    }
}
