<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, dao.CartDAO, dto.CartItemDTO"%>
<%
request.setCharacterEncoding("UTF-8");
String memberId = "testUser";

CartDAO dao = new CartDAO();
List<CartItemDTO> cartList = dao.getCartItemList(memberId);
int total = 0;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>장바구니</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <div class="p-5 mb-4 bg-body-tertiary rounded-3">
    <h1 class="display-5 fw-bold">🛒 장바구니</h1>
    <p class="fs-5"><%= memberId %>님의 장바구니 목록입니다.</p>
  </div>

  <form action="updateCart.jsp" method="post">
    <table class="table table-bordered table-hover text-center align-middle">
      <thead class="table-secondary">
        <tr>
          <th>선택</th>
          <th>상품명</th>
          <th>수량</th>
          <th>가격</th>
          <th>소계</th>
          <th>삭제</th>
        </tr>
      </thead>
      <tbody>
        <%
        if (cartList == null || cartList.isEmpty()) {
        %>
        <tr>
          <td colspan="6" class="text-muted">장바구니가 비어 있습니다.</td>
        </tr>
        <%
        } else {
          for (CartItemDTO item : cartList) {
            int subtotal = (int)(item.getPrice() * item.getQuantity());
            total += subtotal;
        %>
        <tr>
          <td><input type="checkbox" name="selectedItems" value="<%= item.getProductId() %>"></td>
          <td><%= item.getProductName() %></td>
          <td class="d-flex justify-content-center align-items-center gap-2">
            <input type="hidden" name="memberId_<%= item.getProductId() %>" value="<%= memberId %>">
            <input type="hidden" name="productId_<%= item.getProductId() %>" value="<%= item.getProductId() %>">
            <input type="number" name="quantity_<%= item.getProductId() %>" value="<%= item.getQuantity() %>" min="1" class="form-control form-control-sm" style="width: 70px;">
            <button type="submit" name="updateProductId" value="<%= item.getProductId() %>" class="btn btn-sm btn-outline-primary">수정</button>
          </td>
          <td><%= item.getPrice() %> 원</td>
          <td><%= subtotal %> 원</td>
          <td>
            <button type="submit" name="deleteProductId" value="<%= item.getProductId() %>" class="btn btn-sm btn-outline-danger">삭제</button>
          </td>
        </tr>
        <%
          }
        }
        %>
      </tbody>
      <tfoot>
        <tr class="table-light">
          <td colspan="4" class="text-end"><strong>총 합계</strong></td>
          <td colspan="2"><strong><%= total %> 원</strong></td>
        </tr>
      </tfoot>
    </table>

<div class="d-flex gap-2">
  <input type="hidden" name="memberId" value="<%= memberId %>">
  <input type="hidden" name="total" value="<%= total %>">

    <div class="d-flex gap-2">
      <button formaction="deleteSelectedCart.jsp" formmethod="post" class="btn btn-danger">🗑 선택 삭제</button>
      <button formaction="clearCart.jsp" formmethod="post" class="btn btn-outline-danger">전체 비우기</button>
      <button formaction="checkout.jsp" formmethod="post" class="btn btn-success">💳 결제하기</button>
    </div>
  </form>
</div>
</body>
</html>
