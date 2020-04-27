package com.football.crud.bean;

public class History {
    private Integer hisId;

    private String hisText;

    private String hisImg;

    public Integer getHisId() {
        return hisId;
    }

    public void setHisId(Integer hisId) {
        this.hisId = hisId;
    }

    public String getHisText() {
        return hisText;
    }

    public void setHisText(String hisText) {
        this.hisText = hisText == null ? null : hisText.trim();
    }

    public String getHisImg() {
        return hisImg;
    }

    public void setHisImg(String hisImg) {
        this.hisImg = hisImg == null ? null : hisImg.trim();
    }
}