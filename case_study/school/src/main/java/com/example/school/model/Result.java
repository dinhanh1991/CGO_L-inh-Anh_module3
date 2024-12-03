package com.example.school.model;

public class Result {
    private int id;
    private int studentId;
    private float math;
    private float physics;
    private float chemistry;
    private float literature;
    private float history;
    private float geography;
    private float english;
    private float informatics;
    private float physicalEducation;
    private float civicEducation;
    public Result(int id, int studentId, float math, float physics, float chemistry, float literature,
                  float history, float geography, float english, float informatics, float physicalEducation,
                  float civicEducation) {
        this.id = id;
        this.studentId = studentId;
        this.math = math;
        this.physics = physics;
        this.chemistry = chemistry;
        this.literature = literature;
        this.history = history;
        this.geography = geography;
        this.english = english;
        this.informatics = informatics;
        this.physicalEducation = physicalEducation;
        this.civicEducation = civicEducation;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getPhysicalEducation() {
        return physicalEducation;
    }

    public void setPhysicalEducation(float physicalEducation) {
        this.physicalEducation = physicalEducation;
    }

    public float getInformatics() {
        return informatics;
    }

    public void setInformatics(float informatics) {
        this.informatics = informatics;
    }

    public float getEnglish() {
        return english;
    }

    public void setEnglish(float english) {
        this.english = english;
    }

    public float getGeography() {
        return geography;
    }

    public void setGeography(float geography) {
        this.geography = geography;
    }

    public float getHistory() {
        return history;
    }

    public void setHistory(float history) {
        this.history = history;
    }

    public float getLiterature() {
        return literature;
    }

    public void setLiterature(float literature) {
        this.literature = literature;
    }

    public float getChemistry() {
        return chemistry;
    }

    public void setChemistry(float chemistry) {
        this.chemistry = chemistry;
    }

    public float getPhysics() {
        return physics;
    }

    public void setPhysics(float physics) {
        this.physics = physics;
    }

    public float getMath() {
        return math;
    }

    public void setMath(float math) {
        this.math = math;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public float getCivicEducation() {
        return civicEducation;
    }

    public void setCivicEducation(float civicEducation) {
        this.civicEducation = civicEducation;
    }
    public float calculateAverageScore() {
        return (math + physics + chemistry + literature + history + geography + english + informatics
                + physicalEducation + civicEducation) / 10.0f;
    }
}
