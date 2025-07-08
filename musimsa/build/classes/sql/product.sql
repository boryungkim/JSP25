DROP TABLE IF EXISTS cart;
DROP TABLE IF EXISTS ProductVariant;
DROP TABLE IF EXISTS ProductImage;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Category;

CREATE TABLE IF NOT EXISTS Category (
  category_id INT AUTO_INCREMENT PRIMARY KEY,   -- PK: 분류 고유 ID
  name VARCHAR(50) NOT NULL,                    -- 분류명 (예: '상의', '하의')
  description TEXT,                             -- 분류 설명 (선택)
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP -- 레코드 생성 시각
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

/* 2) 상품 테이블: 기본 상품 정보 + 대표 이미지 경로 저장 */
CREATE TABLE IF NOT EXISTS Product (
  product_id INT AUTO_INCREMENT PRIMARY KEY,         -- PK: 상품 고유 ID
  category_id INT NOT NULL,                          -- FK: Category.category_id 참조
  name VARCHAR(100) NOT NULL,                        -- 상품명
  description TEXT,                                  -- 상품 상세 설명
  price DECIMAL(10,2) NOT NULL,                      -- 가격 (예: 49900.00)
  image_path VARCHAR(255) NOT NULL,                  -- 대표 이미지 상대경로/URL
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,     -- 생성 시각
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP      -- 수정 시각 (UPDATE 시 자동 변경)
     ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id)
    REFERENCES Category(category_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

/* 3) 상품 옵션(Variant) 테이블: 색상·사이즈별 재고 관리 */
CREATE TABLE IF NOT EXISTS ProductVariant (
  variant_id INT AUTO_INCREMENT PRIMARY KEY,     -- PK: 옵션 레코드 ID
  product_id INT NOT NULL,                       -- FK: Product.product_id 참조
  color VARCHAR(30),                             -- 색상 (예: 'Red', 'Blue')
  size VARCHAR(10),                              -- 사이즈 (예: 'S', 'M', 'L')
  stock INT DEFAULT 0,                           -- 재고 수량
  sku VARCHAR(50) UNIQUE,                        -- 재고 관리용 고유 코드
  FOREIGN KEY (product_id)
    REFERENCES Product(product_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

/* 4) 상품 이미지 테이블: 다중 이미지 URL/경로 관리 */
CREATE TABLE IF NOT EXISTS ProductImage (
  image_id INT AUTO_INCREMENT PRIMARY KEY,   -- PK: 이미지 고유 ID
  product_id INT NOT NULL,                   -- FK: Product.product_id 참조
  image_path VARCHAR(255) NOT NULL,          -- 이미지 저장 경로/URL
  sort_order INT DEFAULT 0,                  -- 이미지 출력 순서 (작을수록 앞)
  FOREIGN KEY (product_id)
    REFERENCES Product(product_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
  
INSERT INTO Category (name, description) VALUES
('상의', '상의 제품 모음'),
('하의', '하의 제품 모음'),
('신발', '신발 제품 모음'),
('가방', '가방 제품 모음');
  
  
  

-- 예시: 카테고리 ID는 일단 전부 1로 지정 (기존에 등록된 카테고리 확인해서 바꿔도 됨)
INSERT INTO Product (category_id, name, description, price, image_path)
VALUES
(1, '오버핏 긴팔티', '따뜻한 기본템, 간절기 필수 아이템', 32000.00, 'images/product1.jpg'),
(1, '데님 셔츠', '캐주얼 데일리룩에 딱 좋은 셔츠', 49000.00, 'images/product2.jpg'),
(2, '그냥 캔버스화', '편하게 신기 좋은 기본 캔버스화', 59000.00, 'images/product3.jpg'),
(2, '캐치-기모-와이드-팬츠', '부드러운 기모 안감의 와이드핏 팬츠', 35000.00, 'images/product4.jpg'),
(1, '캐주얼 후드', '루즈핏으로 편안한 데일리 후드', 35000.00, 'images/product5.jpg'),
(1, '그냥 여름셔츠', '시원한 린넨 소재 여름 셔츠', 24000.00, 'images/product6.jpg'),
(2, '데님 세트', '세련된 셋업 룩, 활용도 높은 아이템', 66000.00, 'images/product7.jpg'),
(3, '6cm 키높이 독일군 스니커즈', '깔끔한 라인의 키높이 스니커즈', 49000.00, 'images/product8.jpg'),
(4, '생활 방수 백팩', '실용성 좋은 방수 백팩', 49000.00, 'images/product9.jpg');

SELECT * FROM Product;
