package com.football.crud.bean;

public class AdVideo {
    private Integer advId;

    private String advTitle;

    private String advText;

    private String advPath;

    public Integer getAdvId() {
        return advId;
    }

    public void setAdvId(Integer advId) {
        this.advId = advId;
    }

    public String getAdvTitle() {
        return advTitle;
    }

    public void setAdvTitle(String advTitle) {
        this.advTitle = advTitle == null ? null : advTitle.trim();
    }

    public String getAdvText() {
        return advText;
    }

    public void setAdvText(String advText) {
        this.advText = advText == null ? null : advText.trim();
    }

    public String getAdvPath() {
        return advPath;
    }

    public void setAdvPath(String advPath) {
        this.advPath = advPath == null ? null : advPath.trim();
    }
}