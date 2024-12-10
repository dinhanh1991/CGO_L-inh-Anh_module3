package com.example.school.model;

public class TeacherAssignment {
    private String id;
    private String teacherId;
    private String subject;
    private String teachingClasses;
    private String homeroomClass;

    public TeacherAssignment(String id) {
        this.id = id;
    }

    public TeacherAssignment(String id, String teacherId, String subject, String teachingClasses, String homeroomClass) {
        this.id = id;
        this.teacherId = teacherId;
        this.subject = subject;
        this.teachingClasses = teachingClasses;
        this.homeroomClass = homeroomClass;
    }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
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
