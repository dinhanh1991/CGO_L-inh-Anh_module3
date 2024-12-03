package com.example.school.model;

public class TeacherAssignment {
    private int id;
    private int teacherId;
    private String subject;
    private String teachingClasses;
    private String homeroomClass;
    public TeacherAssignment(int id, int teacherId, String subject, String teachingClasses, String homeroomClass) {
        this.id = id;
        this.teacherId = teacherId;
        this.subject = subject;
        this.teachingClasses = teachingClasses;
        this.homeroomClass = homeroomClass;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTeachingClasses() {
        return teachingClasses;
    }

    public void setTeachingClasses(String teachingClasses) {
        this.teachingClasses = teachingClasses;
    }

    public String getHomeroomClass() {
        return homeroomClass;
    }

    public void setHomeroomClass(String homeroomClass) {
        this.homeroomClass = homeroomClass;
    }
}
