<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.CartDAO" %>
<%
    request.setCharacterEncoding("UTF-8");

    String memberId = "testUser";
    String productId = request.getParameter("productId");
    int quantity = Integer.parseInt(request.getParameter("quantity"));

    CartDAO dao = new CartDAO();
    dao.addToCart(memberId, productId, quantity);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>장바구니 추가</title>
  <script>
    alert('장바구니에 추가되었습니다.');
    location.href = 'cart.jsp';
  </script>
</head>
<body></body>
</html>
