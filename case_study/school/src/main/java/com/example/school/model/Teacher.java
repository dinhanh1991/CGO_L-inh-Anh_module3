package com.example.school.model;

public class Teacher {
    private int id;
    private String name;
    private String email;
    private String homeRoomClassName;
    private String subject;
    private String teachingClass;

    public Teacher(String name, String email, String homeRoomClassName, String subject, String teachingClass) {
        this.name = name;
        this.email = email;
        this.homeRoomClassName = homeRoomClassName;
        this.subject = subject;
        this.teachingClass = teachingClass;
    }

    public Teacher(int id, String name, String email, String homeRoomClassName, String subject, String teachingClass) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.homeRoomClassName = homeRoomClassName;
        this.subject = subject;
        this.teachingClass = teachingClass;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHomeRoomClassName() {
        return homeRoomClassName;
    }

    public void setHomeRoomClassName(String homeRoomClassName) {
        this.homeRoomClassName = homeRoomClassName;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTeachingClass() {
        return teachingClass;
    }

    public void setTeachingClass(String teachingClass) {
        this.teachingClass = teachingClass;
    }
}
