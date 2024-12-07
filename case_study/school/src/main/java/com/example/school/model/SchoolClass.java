package com.example.school.model;

public class SchoolClass {
    private int id;
    private String className;
    private int teacherId;
    private int totalStudents;

    public SchoolClass(String className, int teacherId, int totalStudents) {
        this.className = className;
        this.teacherId = teacherId;
        this.totalStudents = totalStudents;
    }

    public SchoolClass(int id, String className, int teacherId, int totalStudents) {
        this.id = id;
        this.className = className;
        this.teacherId = teacherId;
        this.totalStudents = totalStudents;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getTotalStudents() {
        return totalStudents;
    }

    public void setTotalStudents(int totalStudents) {
        this.totalStudents = totalStudents;
    }
}
