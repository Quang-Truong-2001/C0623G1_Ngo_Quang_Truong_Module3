package com.example.user.model;

public class Permision {
    private int idPermision;
    private String name;

    public Permision(int idPermission, String name) {
        this.idPermision = idPermission;
        this.name = name;
    }

    public Permision(String name) {
        this.name = name;
    }

    public Permision() {
    }

    public int getIdPermision() {
        return idPermision;
    }

    public void setIdPermision(int idPermision) {
        this.idPermision = idPermision;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
