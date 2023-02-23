<%@page import="dto.Cart"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}

 	ProductRepository dao = ProductRepository.getInstance();

	Product product = dao.getProductById(id);
	if (product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}

	ArrayList<Product> goodsList = dao.getAllProducts();
	Product goods = new Product();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getProductId().equals(id)) { 				
			break;
		}
	} 
	
	
	//업데이트
	//ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
	ArrayList<Cart> list = new ArrayList<>();
	String sql1 = "select * from cart";
	pstmt = conn.prepareStatement(sql1);
	rs = pstmt.executeQuery();
	while (rs.next()) {		
		String cartId=rs.getString("c_id");
		String productId=rs.getString("p_id");
		String pname=rs.getString("p_name");
		int unitPrice=rs.getInt("p_unitPrice");
		int quantity=rs.getInt("c_quantity");
		int total=rs.getInt("c_total");
		Cart cart =new Cart(cartId, productId, pname,unitPrice,quantity,total) ;
		list.add(cart);
	}
	
	
	
	if (list == null) { 
		list = new ArrayList<Cart>();
	}

	
	int cnt = 0;
	Cart goodsQnt = new Cart();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
		
			goods.setQuantity(orderQuantity);
		}
	}

	
	if (cnt == 0) { 
		goods.setQuantity(1);
	}

	//DB에 장바구니 등록처리 
	String cartId=session.getId();
	String username=request.getRemoteUser();
	Cart cart =new Cart(cartId,goods.getProductId(), goods.getPname(), goods.getUnitPrice(), goods.getQuantity(), goods.getUnitPrice()*goods.getQuantity()) ;		
		
	
	String sql2 = " insert into cart(c_id, p_id,  p_name, p_unitPrice, c_quantity, c_total)  ";
		   sql2 += " VALUES(? ,  ?,  ?,  ?, ?, ?) ";
		   sql2 += " ON DUPLICATE KEY  " ;
		   sql2 += " UPDATE c_quantity = ? ";
		   
		   
	pstmt = conn.prepareStatement(sql2);	
	pstmt.setString(1, cart.getCartId());
	pstmt.setString(2, cart.getProductId());
	pstmt.setString(3, cart.getPname());
	pstmt.setInt(4, cart.getUnitPrice());
	pstmt.setInt(5,cart.getQuantity());
	pstmt.setInt(6, cart.getTotal());
	pstmt.setInt(7, cart.getQuantity());
	
	pstmt.executeUpdate();
	
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
 	
	response.sendRedirect("product.jsp?cartAdd=success&id=" + id);
%>


