package dto;

import java.io.Serializable;


public class Cart implements Serializable {

	private static final long serialVersionUID = -4274700572038677000L;

	private String cartId;		//장바구니 아이디	
	private String productId;	//상품 아이디
	private String pname;		//상품명
	private Integer unitPrice;  //상품 가격	
	private int quantity;	 	//장바구니에 담은 개수
	private int total;		 	//소계

	public Cart() {
		super();
	}

	public Cart(String cartId, String productId,  String pname, Integer unitPrice, Integer quantity, Integer total ) {
		this.cartId=cartId;
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
		this.quantity=quantity;
		this.total=total;
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
		return "Cart [cartId=" + cartId + ", productId=" + productId + ",  pname=" + pname
				+ ", unitPrice=" + unitPrice + ", quantity=" + quantity + ", total=" + total + "]";
	}
	
	

}
