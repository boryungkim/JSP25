<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  request.setCharacterEncoding("UTF-8");
  String memberId = (String) session.getAttribute("sessionId");
  String total = request.getParameter("total");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>결제 완료</title>
</head>
<body>
  <h2>💳 결제가 성공적으로 완료되었습니다!</h2>

  <p><strong><%= memberId %></strong>님, 감사합니다.</p>
  <p>총 결제 금액은 <strong><%= total %></strong>원 입니다.</p>

  <a href="welcome.jsp">🏠 홈으로 돌아가기</a>
</body>
</html>
