package com.lilac.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class TransactionLog {
    private Integer id;
    private User purchaser;
    private Domain domain;
    private String orderType;
    private String detail;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date createTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date updateTime;

    public TransactionLog() {
    }

    public DomainInfo ToDomainInfo() {
        return new DomainInfo(
                this.domain.getId(),
                this.domain.getDomainName(),
                this.purchaser.getId(),
                this.purchaser.getUserName(),
                this.domain.getPrice(),
                this.domain.getInfo(),
                this.domain.getStatus(),
                this.domain.getExpireTime(),
                this.domain.getCreateTime(),
                this.domain.getUpdateTime()
        );
    }

    public TransactionLog(Integer id, User purchaser, Domain domain, String orderType, String detail, Date createTime, Date updateTime) {
        this.id = id;
        this.purchaser = purchaser;
        this.domain = domain;
        this.orderType = orderType;
        this.detail = detail;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getPurchaser() {
        return purchaser;
    }

    public void setPurchaser(User purchaser) {
        this.purchaser = purchaser;
    }

    public Domain getDomain() {
        return domain;
    }

    public void setDomain(Domain domain) {
        this.domain = domain;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "TransactionLog{" +
                "id=" + id +
                ", purchaser=" + purchaser +
                ", domain=" + domain +
                ", orderType='" + orderType + '\'' +
                ", detail='" + detail + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
