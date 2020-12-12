package com.pojo;

public class authority {

    private int authoid;
    private String authoName;

    public authority() {
    }

    public authority(int authoid, String authoName) {
        this.authoid = authoid;
        this.authoName = authoName;
    }

    public int getAuthoid() {
        return authoid;
    }

    public void setAuthoid(int authoid) {
        this.authoid = authoid;
    }

    public String getAuthoName() {
        return authoName;
    }

    public void setAuthoName(String authoName) {
        this.authoName = authoName;
    }

    @Override
    public String toString() {
        return "authority{" +
                "authoid=" + authoid +
                ", authoName='" + authoName + '\'' +
                '}';
    }
}
