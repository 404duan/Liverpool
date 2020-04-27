package com.football.crud.bean;

import java.math.BigDecimal;

public class Player {
    private Integer playerId;

    private String playerName;

    private String playerFullname;

    private String playerPhoto;

    private Integer playerNum;

    private Integer playerHeight;

    private Integer playerWeight;

    private String playerNation;

    private String playerBirth;

    private BigDecimal playerWage;

    private String playerContract;

    private String playerPos;

    public Integer getPlayerId() {
        return playerId;
    }

    public void setPlayerId(Integer playerId) {
        this.playerId = playerId;
    }

    public String getPlayerName() {
        return playerName;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName == null ? null : playerName.trim();
    }

    public String getPlayerFullname() {
        return playerFullname;
    }

    public void setPlayerFullname(String playerFullname) {
        this.playerFullname = playerFullname == null ? null : playerFullname.trim();
    }

    public String getPlayerPhoto() {
        return playerPhoto;
    }

    public void setPlayerPhoto(String playerPhoto) {
        this.playerPhoto = playerPhoto == null ? null : playerPhoto.trim();
    }

    public Integer getPlayerNum() {
        return playerNum;
    }

    public void setPlayerNum(Integer playerNum) {
        this.playerNum = playerNum;
    }

    public Integer getPlayerHeight() {
        return playerHeight;
    }

    public void setPlayerHeight(Integer playerHeight) {
        this.playerHeight = playerHeight;
    }

    public Integer getPlayerWeight() {
        return playerWeight;
    }

    public void setPlayerWeight(Integer playerWeight) {
        this.playerWeight = playerWeight;
    }

    public String getPlayerNation() {
        return playerNation;
    }

    public void setPlayerNation(String playerNation) {
        this.playerNation = playerNation == null ? null : playerNation.trim();
    }

    public String getPlayerBirth() {
        return playerBirth;
    }

    public void setPlayerBirth(String playerBirth) {
        this.playerBirth = playerBirth == null ? null : playerBirth.trim();
    }

    public BigDecimal getPlayerWage() {
        return playerWage;
    }

    public void setPlayerWage(BigDecimal playerWage) {
        this.playerWage = playerWage;
    }

    public String getPlayerContract() {
        return playerContract;
    }

    public void setPlayerContract(String playerContract) {
        this.playerContract = playerContract == null ? null : playerContract.trim();
    }

    public String getPlayerPos() {
        return playerPos;
    }

    public void setPlayerPos(String playerPos) {
        this.playerPos = playerPos == null ? null : playerPos.trim();
    }
}