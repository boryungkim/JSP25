<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.CartDAO" %>
<%
    request.setCharacterEncoding("UTF-8");

    try {
        String memberId = "testUser";  // 고정 테스트용
        int productId = Integer.parseInt(request.getParameter("updateProductId")); // ✅ 정확한 파라미터명
        int quantity = Integer.parseInt(request.getParameter("quantity_" + productId)); // ✅ 해당 상품에 대한 수량 입력 필드명

        CartDAO dao = new CartDAO();
        dao.updateCart(memberId, productId, quantity);
%>
        <script>
            alert('수량이 수정되었습니다.');
            location.href = 'cart.jsp';
        </script>
<%
    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert('수량 수정에 실패했습니다.');
            location.href = 'cart.jsp';
        </script>
<%
    }
%>
