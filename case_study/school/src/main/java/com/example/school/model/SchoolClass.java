package com.example.school.model;

public class SchoolClass {
    private String id;
    private String className;
    private String teacherId;
    private int totalStudents;

    public SchoolClass(String className, String teacherId, int totalStudents) {
        this.className = className;
        this.teacherId = teacherId;
        this.totalStudents = totalStudents;
    }

    public SchoolClass(String id, String className, String teacherId, int totalStudents) {
        this.id = id;
        this.className = className;
        this.teacherId = teacherId;
        this.totalStudents = totalStudents;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public int getTotalStudents() {
        return totalStudents;
    }

    public void setTotalStudents(int totalStudents) {
        this.totalStudents = totalStudents;
    }
}
