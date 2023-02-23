<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="dbconn.jsp" %>

<%
	String id = request.getParameter("cartId");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("cart.jsp");
		return;
	}

	String sql = "delete from cart where c_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, 	id);
	pstmt.executeUpdate();
	
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
 	
	
	response.sendRedirect("cart.jsp");
%>
