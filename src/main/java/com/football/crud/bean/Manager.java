package com.football.crud.bean;

public class Manager {
    private Integer manId;

    private String manName;

    private String manForname;

    private String manNation;

    private String manYear;

    private Integer manType;

    private String manTitle;

    private String manImg;

    public Integer getManId() {
        return manId;
    }

    public void setManId(Integer manId) {
        this.manId = manId;
    }

    public String getManName() {
        return manName;
    }

    public void setManName(String manName) {
        this.manName = manName == null ? null : manName.trim();
    }

    public String getManForname() {
        return manForname;
    }

    public void setManForname(String manForname) {
        this.manForname = manForname == null ? null : manForname.trim();
    }

    public String getManNation() {
        return manNation;
    }

    public void setManNation(String manNation) {
        this.manNation = manNation == null ? null : manNation.trim();
    }

    public String getManYear() {
        return manYear;
    }

    public void setManYear(String manYear) {
        this.manYear = manYear;
    }

    public Integer getManType() {
        return manType;
    }

    public void setManType(Integer manType) {
        this.manType = manType;
    }

    public String getManTitle() {
        return manTitle;
    }

    public void setManTitle(String manTitle) {
        this.manTitle = manTitle == null ? null : manTitle.trim();
    }

    public String getManImg() {
        return manImg;
    }

    public void setManImg(String manImg) {
        this.manImg = manImg == null ? null : manImg.trim();
    }
}