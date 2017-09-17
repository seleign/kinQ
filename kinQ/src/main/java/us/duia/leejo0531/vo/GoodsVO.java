package us.duia.leejo0531.vo;

public class GoodsVO {
	
	private int goodsNum;
	private String goodsName;
	private int price;
	private String imageurl;
	
	public GoodsVO(){}
	
	public GoodsVO(int goodsNum, String goodsName, int price, String imageurl) {
		super();
		this.goodsNum = goodsNum;
		this.goodsName = goodsName;
		this.price = price;
		this.imageurl = imageurl;
	}
	
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	@Override
	public String toString() {
		return "GoodsVO [goodsNum=" + goodsNum + ", goodsName=" + goodsName + ", price=" + price + ", imageurl="
				+ imageurl + "]";
	}
	
}
