package com.example.school.model;

public class Student {
    private String id;
    private String name;
    private String className;
    private String teacherId;
    private float averageScore;
    private String password;
    private String email;
    private String classifyStudent;
    public Student() {}

    public Student(String id, String name, String className, float averageScore, String classifyStudent) {
        this.id = id;
        this.name = name;
        this.className = className;
        this.averageScore = averageScore;
        this.classifyStudent = classifyStudent;
    }

    public Student(String id, String name, String className, String password, String email) {
        this.id = id;
        this.name = name;
        this.className = className;
        this.password = password;
        this.email = email;
    }

    public Student(String name, String className,String password, String email) {
        this.name = name;
        this.className = className;
        this.password = password;
        this.email = email;
    }
    public Student(String id, String name, String className, String teacherId, float averageScore, String password, String email) {
        this.id = id;
        this.name = name;
        this.className = className;
        this.teacherId = teacherId;
        this.averageScore = averageScore;
        this.password = password;
        this.email = email;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
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

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
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

    public String getClassifyStudent() {
        return classifyStudent;
    }

    public void setClassifyStudent(String classifyStudent) {
        this.classifyStudent = classifyStudent;
    }
}
