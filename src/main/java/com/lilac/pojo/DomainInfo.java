package com.lilac.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.util.Date;

public class DomainInfo {
    public Integer domainId;

    private String domainName;

    private Integer purchaserId;

    private String purchaserUserName;

    private BigDecimal price;
    private String info;
    private Integer status;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date expireTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date createTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date updateTime;

    public DomainInfo() {
    }

    public DomainInfo(Integer domainId, String domainName, Integer purchaserId, String purchaserUserName, BigDecimal price, String info, Integer status, Date expireTime, Date createTime, Date updateTime) {
        this.domainId = domainId;
        this.domainName = domainName;
        this.purchaserId = purchaserId;
        this.purchaserUserName = purchaserUserName;
        this.price = price;
        this.info = info;
        this.status = status;
        this.expireTime = expireTime;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public Integer getDomainId() {
        return domainId;
    }

    public void setDomainId(Integer domainId) {
        this.domainId = domainId;
    }

    public String getDomainName() {
        return domainName;
    }

    public void setDomainName(String domainName) {
        this.domainName = domainName;
    }

    public Integer getPurchaserId() {
        return purchaserId;
    }

    public void setPurchaserId(Integer purchaserId) {
        this.purchaserId = purchaserId;
    }

    public String getPurchaserUserName() {
        return purchaserUserName;
    }

    public void setPurchaserUserName(String purchaserUserName) {
        this.purchaserUserName = purchaserUserName;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(Date expireTime) {
        this.expireTime = expireTime;
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

    public String ToString(){
        return "\n{+JavaObject DomainInfo PoJO: [" + this.domainName + "("+ this.domainId +")" + "]:\n" +
                "   Purchaser: " + this.purchaserUserName + " (" + this.purchaserId + ") \n" +
                "   Price: " + this.price + " (#$) \n" +
                "   Status(Info): " + this.status + " (" + this.info + ") \n" +
                "   Times: \n" +
                "       Create at: " + this.createTime + " \n" +
                "       Update at: " + this.updateTime + " \n" +
                "       Expire at: " + this.expireTime + " \n" +
                "end of DomainInfo ToString()+}";
    }
}
