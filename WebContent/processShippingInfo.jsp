<%@page import="dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Order"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
	Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie shippingDate = new Cookie("Shipping_shippingDate",	URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
	Cookie country = new Cookie("Shipping_country",	URLEncoder.encode(request.getParameter("country"), "utf-8"));
	Cookie zipCode = new Cookie("Shipping_zipCode",	URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
	Cookie addressName = new Cookie("Shipping_addressName",	URLEncoder.encode(request.getParameter("addressName"), "utf-8"));

	cartId.setMaxAge(24 * 60 * 60);
	name.setMaxAge(24 * 60 * 60);
	zipCode.setMaxAge( 24 * 60 * 60);
	country.setMaxAge(24 * 60 * 60);
	addressName.setMaxAge(24 * 60 * 60);

	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);

	
	//DB에 장바구니 등록처리 
		
	String sql = "SELECT * FROM cart WHERE c_id = ? ";
	 
	 
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, cartId.getValue());
	rs = pstmt.executeQuery();
		
	ArrayList<Cart> cartList = new ArrayList<>();						
	while (rs.next()) {		
		String cid=rs.getString("c_id");
		String productId=rs.getString("p_id");
		String pname=rs.getString("p_name");
		int unitPrice=rs.getInt("p_unitPrice");
		int quantity=rs.getInt("c_quantity");
		int total=rs.getInt("c_total");
		Cart cart =new Cart(cid,productId,pname,unitPrice,quantity,total);
		cartList.add(cart);
	}					
	
	int sum = 0;

	
	
	for (int i = 0; i < cartList.size(); i++) { 
		     System.out.println(" 주문하기  장바구니 목록----------");
			Cart cart = cartList.get(i);
			sum +=cart.getTotal();

			String sql2 = " 	INSERT INTO `order`  ";
				   sql2 += " (name, zipCode, addressName, country, shippingDate, c_id, p_id, p_name, p_unitPrice, c_quantity, c_total) ";
				   sql2 += " VALUES( ?, ?, ?,  ?,  ?,  ?,  ?, ?,  ?,  ?,  ?) " ;
				   
			pstmt = conn.prepareStatement(sql2);	
			pstmt.setString(1, request.getParameter("name"));
			pstmt.setString(2, request.getParameter("zipCode"));
			pstmt.setString(3, request.getParameter("addressName"));
			pstmt.setString(4, request.getParameter("country"));
			pstmt.setString(5, request.getParameter("shippingDate"));
			
			pstmt.setString(6, cart.getCartId());
			pstmt.setString(7, cart.getProductId());
			pstmt.setString(8, cart.getPname());
			
			pstmt.setInt(9, cart.getUnitPrice());
			pstmt.setInt(10, cart.getQuantity());
			pstmt.setInt(11, cart.getTotal());						
			pstmt.executeUpdate();

	}
	
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
	
	response.sendRedirect("orderConfirmation.jsp");
%>
