<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String total = request.getParameter("total");
    String memberId = request.getParameter("memberId");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>결제 처리</title>
  <script>
    alert('결제가 완료되었습니다!');
    location.href = 'checkoutSuccess.jsp?memberId=<%= memberId %>&total=<%= total %>';
  </script>
</head>
<body></body>
</html>
