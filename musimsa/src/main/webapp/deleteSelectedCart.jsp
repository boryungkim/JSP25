<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.CartDAO" %>
<%
    request.setCharacterEncoding("UTF-8");

    String memberId = request.getParameter("memberId");
    String[] selectedItems = request.getParameterValues("selectedItems");

    CartDAO dao = new CartDAO();

    if (selectedItems != null) {
        for (String productId : selectedItems) {
        	 dao.deleteCart(memberId, Integer.parseInt(productId)); 
        }
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>선택 삭제 완료</title>
  <script>
    alert('선택한 항목이 삭제되었습니다.');
    location.href = 'cart.jsp';
  </script>
</head>
<body></body>
</html>
