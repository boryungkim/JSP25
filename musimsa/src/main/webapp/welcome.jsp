<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>MUSIMSA</title>
  <link rel="stylesheet" href="<c:url value='/style.css' />">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .navbar-brand {
      font-weight: bold;
      font-size: 24px;
    }
    .nav-link {
      margin-right: 15px;
    }
  </style>
</head>
<body>

<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom">
  <div class="container-fluid">
    <a class="navbar-brand" href="<c:url value='/welcome.jsp' />">MUSIMSA</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="<c:url value='/books.jsp'/>">신상품</a></li>
        <li class="nav-item"><a class="nav-link" href="<c:url value='/addBook.jsp'/>">랭킹</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">카테고리</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">아우터</a></li>
            <li><a class="dropdown-item" href="#">탑</a></li>
            <li><a class="dropdown-item" href="#">바텀</a></li>
            <li><a class="dropdown-item" href="#">신발</a></li>
          </ul>
        </li>
        <li class="nav-item"><a class="nav-link" href="#">브랜드</a></li>
        <li class="nav-item"><a class="nav-link" href="#">기획</a></li>
        <li class="nav-item"><a class="nav-link" href="<c:url value='/cart.jsp'/>">장바구니</a></li>
        <li class="nav-item"><a class="nav-link" href="<c:url value='/BoardListAction.do?pageNum=1'/>">게시판</a></li>
      </ul>

      <ul class="navbar-nav">
        <c:choose>
          <c:when test="${empty sessionId}">
            <li class="nav-item"><a class="nav-link" href="<c:url value='/member/loginMember.jsp'/>">로그인</a></li>
            <li class="nav-item"><a class="nav-link" href="<c:url value='/member/addMember.jsp'/>">회원가입</a></li>
          </c:when>
          <c:otherwise>
            <li class="nav-item nav-link">[<%=sessionId%>님]</li>
            <li class="nav-item"><a class="nav-link" href="<c:url value='/member/logoutMember.jsp'/>">로그아웃</a></li>
            <li class="nav-item"><a class="nav-link" href="<c:url value='/member/updateMember.jsp'/>">회원 수정</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>
  </div>
</nav>

<!-- Bootstrap JS (dropdown 동작용) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>