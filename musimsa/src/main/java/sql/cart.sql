DROP TABLE IF EXISTS cart;

CREATE TABLE cart (
  member_id VARCHAR(50) NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL DEFAULT 1,
  PRIMARY KEY (member_id, product_id),
  FOREIGN KEY (product_id)
    REFERENCES Product(product_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


INSERT INTO cart (member_id, product_id, quantity) VALUES 
('testUser', 1, 2),
('testUser', 3, 4),  -- 3번 상품 4개
('testUser', 4, 1),  -- 4번 상품 1개
('testUser', 5, 3);  -- 5번 상품 3개

SELECT*FROM CART