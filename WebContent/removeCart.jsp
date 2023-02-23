<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ include file="dbconn.jsp" %>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}

	String sql = "select * from cart";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		sql = "delete from cart where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, 	id);
		pstmt.executeUpdate();
	} else
		out.println("일치하는 상품이 없습니다");
	
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
 
	response.sendRedirect("cart.jsp");
%>
