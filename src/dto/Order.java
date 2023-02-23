package dto;

import java.io.Serializable;



public class Order implements Serializable {

	private int oid;
	private String name;
	private String zipCode;
	private String addressName;
	private String country;
	private String shippingDate;	
	private String cartId; // 장바구니 아이디
	private String productId; // 상품 아이디
	private String pname; // 상품명
	private Integer unitPrice; // 상품 가격
	private int quantity; // 장바구니에 담은 개수
	private int total; // 소계

	public Order() {

	}
	
	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return addressName;
	}

	public void setAddress(String addressName) {
		this.addressName = addressName;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getShippingDate() {
		return shippingDate;
	}

	public void setShippingDate(String shippingDate) {
		this.shippingDate = shippingDate;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}


	@Override
	public String toString() {
		return "Order [oid=" + oid + ", name=" + name + ", zipCode=" + zipCode + ", addressName=" + addressName
				+ ", country=" + country + ", shippingDate=" + shippingDate + ", cartId=" + cartId + ", productId="
				+ productId + ", pname=" + pname + ", unitPrice=" + unitPrice + ", quantity=" + quantity + ", total="
				+ total + "]";
	}
	


}
