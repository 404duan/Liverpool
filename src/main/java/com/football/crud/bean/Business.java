package com.football.crud.bean;

public class Business {
    private Integer busiId;

    private String busiName;

    private String busiForname;

    private String busiType;

    private String busiLogo;

    private String busiHref;

    public Integer getBusiId() {
        return busiId;
    }

    public void setBusiId(Integer busiId) {
        this.busiId = busiId;
    }

    public String getBusiName() {
        return busiName;
    }

    public void setBusiName(String busiName) {
        this.busiName = busiName == null ? null : busiName.trim();
    }

    public String getBusiForname() {
        return busiForname;
    }

    public void setBusiForname(String busiForname) {
        this.busiForname = busiForname == null ? null : busiForname.trim();
    }

    public String getBusiType() {
        return busiType;
    }

    public void setBusiType(String busiType) {
        this.busiType = busiType == null ? null : busiType.trim();
    }

    public String getBusiLogo() {
        return busiLogo;
    }

    public void setBusiLogo(String busiLogo) {
        this.busiLogo = busiLogo == null ? null : busiLogo.trim();
    }

    public String getBusiHref() {
        return busiHref;
    }

    public void setBusiHref(String busiHref) {
        this.busiHref = busiHref == null ? null : busiHref.trim();
    }

	@Override
	public String toString() {
		return "Business [busiId=" + busiId + ", busiName=" + busiName + ", busiForname=" + busiForname + ", busiType="
				+ busiType + ", busiLogo=" + busiLogo + ", busiHref=" + busiHref + "]";
	}
    
}