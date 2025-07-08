package dto;

public class CartItemDTO {
    private int productId;         // 상품 ID
    private String productName;    // 상품명
    private double price;          // 가격 (DECIMAL → double)
    private int quantity;          // 장바구니 수량
    private String imagePath;      // 이미지 URL (선택)

    public CartItemDTO() {}

    public CartItemDTO(int productId, String productName, double price, int quantity, String imagePath) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.imagePath = imagePath;
    }

    public int getProductId() {
        return productId;
    }
    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImagePath() {
        return imagePath;
    }
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}
