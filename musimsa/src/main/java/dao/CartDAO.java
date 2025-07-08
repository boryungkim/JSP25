package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dto.CartItemDTO;
import util.DBConnection;

public class CartDAO {

    private Connection conn;

    public CartDAO() {
        try {
            conn = DBConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 장바구니에 상품 추가
    public void addToCart(String memberId, int productId, int quantity) throws SQLException {
        String sql = "INSERT INTO cart(member_id, product_id, quantity) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, memberId);
            pstmt.setInt(2, productId); // 타입 일치
            pstmt.setInt(3, quantity);
            pstmt.executeUpdate();
        }
    }

    // 상품 정보 포함 장바구니 조회
    public List<CartItemDTO> getCartItemList(String memberId) throws Exception {
        List<CartItemDTO> list = new ArrayList<>();

        String sql = """
            SELECT 
                p.product_id,
                p.name AS product_name,
                p.price,
                p.image_path,
                c.quantity
            FROM cart c
            JOIN product p ON c.product_id = p.product_id
            WHERE c.member_id = ?
        """;

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, memberId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                CartItemDTO item = new CartItemDTO();
                item.setProductId(rs.getInt("product_id"));
                item.setProductName(rs.getString("product_name"));
                item.setPrice(rs.getDouble("price"));
                item.setImagePath(rs.getString("image_path"));
                item.setQuantity(rs.getInt("quantity"));
                list.add(item);
            }
        }

        return list;
    }


    // 수량 수정
    public void updateCart(String memberId, int productId, int quantity) throws Exception {
        String sql = "UPDATE cart SET quantity = ? WHERE member_id = ? AND product_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, quantity);
            pstmt.setString(2, memberId);
            pstmt.setInt(3, productId);

            int rows = pstmt.executeUpdate();
            if (rows == 0) {
                throw new SQLException("장바구니 항목이 존재하지 않습니다.");
            }
        }
    }

    // 장바구니 항목 삭제
    public void deleteCart(String memberId, int productId) throws Exception {
        String sql = "DELETE FROM cart WHERE member_id = ? AND product_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, memberId);
            pstmt.setInt(2, productId);
            pstmt.executeUpdate();
        }
    }

    // 선택 항목 삭제
    public void deleteSelectedItems(String memberId, List<Integer> productIds) throws Exception {
        String sql = "DELETE FROM cart WHERE member_id = ? AND product_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            for (int productId : productIds) {
                pstmt.setString(1, memberId);
                pstmt.setInt(2, productId);
                pstmt.executeUpdate();
            }
        }
    }

    // 전체 장바구니 비우기
    public void clearCart(String memberId) throws Exception {
        String sql = "DELETE FROM cart WHERE member_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, memberId);
            pstmt.executeUpdate();
        }
    }
}
