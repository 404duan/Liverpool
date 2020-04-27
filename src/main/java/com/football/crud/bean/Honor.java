package com.football.crud.bean;

import java.util.Date;

public class Honor {
    private Integer horId;

    private String horImg;

    private String horName;

    private String horDetail;

    private Date horTime;

    private String horForname;

    private Integer horType;

    public Integer getHorId() {
        return horId;
    }

    public void setHorId(Integer horId) {
        this.horId = horId;
    }

    public String getHorImg() {
        return horImg;
    }

    public void setHorImg(String horImg) {
        this.horImg = horImg == null ? null : horImg.trim();
    }

    public String getHorName() {
        return horName;
    }

    public void setHorName(String horName) {
        this.horName = horName == null ? null : horName.trim();
    }

    public String getHorDetail() {
        return horDetail;
    }

    public void setHorDetail(String horDetail) {
        this.horDetail = horDetail == null ? null : horDetail.trim();
    }

    public Date getHorTime() {
        return horTime;
    }

    public void setHorTime(Date horTime) {
        this.horTime = horTime;
    }

    public String getHorForname() {
        return horForname;
    }

    public void setHorForname(String horForname) {
        this.horForname = horForname == null ? null : horForname.trim();
    }

    public Integer getHorType() {
        return horType;
    }

    public void setHorType(Integer horType) {
        this.horType = horType;
    }
}