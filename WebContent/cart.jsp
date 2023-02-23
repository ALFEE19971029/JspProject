<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Cart"%>
<%@ page import="java.util.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>장바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<% String cartId = session.getId();%>	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%= cartId %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		
		<%@ include file="dbconn.jsp" %>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%
						String sql = "SELECT * FROM cart WHERE c_id = ? ";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, cartId);
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
		
					if(cartList == null) cartList = new ArrayList<Cart>();

					for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기						
						Cart cart = cartList.get(i);
						sum +=cart.getTotal();
										
				%>
				<tr>
					<td><%=cart.getProductId()%> - <%=cart.getPname()%></td>
					<td><%=cart.getUnitPrice()%></td>
					<td><%=cart.getQuantity()%></td>
					<td><%=cart.getTotal() %></td>
					<td><a href="./removeCart.jsp?id=<%=cart.getProductId()%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
				
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
				</tr>
			</table>
			<a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
