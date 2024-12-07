package com.example.school.model;

public class Student {
    private int id;
    private String name;
    private String className;
    private int teacherId;
    private float averageScore;
    private String password;
    private String email;
    public Student() {}
    public Student( String name, String className, int teacherId, float averageScore, String password, String email) {
        this.name = name;
        this.className = className;
        this.teacherId = teacherId;
        this.averageScore = averageScore;
        this.password = password;
        this.email = email;
    }
    public Student(int id, String name, String className, int teacherId, float averageScore, String password, String email) {
        this.id = id;
        this.name = name;
        this.className = className;
        this.teacherId = teacherId;
        this.averageScore = averageScore;
        this.password = password;
        this.email = email;
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

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public float getAverageScore() {
        return averageScore;
    }

    public void setAverageScore(float averageScore) {
        this.averageScore = averageScore;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
