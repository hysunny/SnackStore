package com.entity;

import java.util.Date;

public class Goods {
	public String goodsname;
	public String goodsDesc;
	public int goodsCount;
	public String goodsUrl;
	public float goodsPrice;
	public String goodsSort;
	
	public float getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	
	public String getGoodsUrl() {
		return goodsUrl;
	}

	public void setGoodsUrl(String goodsUrl) {
		this.goodsUrl = goodsUrl;
	}
	
	
	public String getGoodsSort() {
		return goodsSort;
	}

	public void setGoodsSort(String goodsSort) {
		this.goodsSort = goodsSort;
	}
	
	public int getGoodsCount() {
		return goodsCount;
	}

	public void setGoodsCount(int goodsCount) {
		this.goodsCount = goodsCount;
	}

	public String getGoodsName() {
		return goodsname;
	}

	public void setGoodsName(String goodsname) {
		this.goodsname = goodsname;
	}

	public String getGoodsDesc() {
		return goodsDesc;
	}

	public void setGoodsDesc(String goodsDesc) {
		this.goodsDesc = goodsDesc;
	}

}
