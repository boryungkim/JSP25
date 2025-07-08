<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String memberId = request.getParameter("memberId");
    String total = request.getParameter("total");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>결제 완료</title>
</head>
<body>
  <div class="container py-5">
    <h2>✅ 결제 성공</h2>
    <p><strong><%= memberId %></strong> 님의 결제가 완료되었습니다.</p>
    <p>총 결제 금액: <strong><%= total %></strong> 원</p>
    <a href="cart.jsp">🏠 홈으로 돌아가기</a>
  </div>
</body>
</html>
