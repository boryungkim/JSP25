<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.CartDAO" %>
<%
    request.setCharacterEncoding("UTF-8");

    String memberId = request.getParameter("memberId");

    CartDAO dao = new CartDAO();
    dao.clearCart(memberId);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>장바구니 비우기</title>
  <script>
    alert('장바구니가 비워졌습니다.');
    location.href = 'cart.jsp';
  </script>
</head>
<body></body>
</html>
