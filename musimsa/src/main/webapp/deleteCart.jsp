<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.CartDAO" %>
<%
    request.setCharacterEncoding("UTF-8");

    String memberId = request.getParameter("memberId");
    int productId = Integer.parseInt(request.getParameter("productId"));

    CartDAO dao = new CartDAO();
    dao.deleteCart(memberId, productId);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>삭제 완료</title>
  <script>
    alert('상품이 삭제되었습니다.');
    location.href = 'cart.jsp';
  </script>
</head>
<body></body>
</html>
