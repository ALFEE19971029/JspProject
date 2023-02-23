create user `WebMarketDB`@`localhost` identified by '1234';
create database WebMarketDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
grant all privileges on WebMarketDB.* to `WebMarketDB`@`localhost` ;


CREATE TABLE IF NOT EXISTS cart(
		c_id VARCHAR(50	) NOT NULL,
		p_id VARCHAR(10) NOT NULL,
		p_name VARCHAR(20),
		p_unitPrice  INTEGER,
		c_quantity  INTEGER,
		c_total INTEGER,
		PRIMARY KEY (c_id,p_id)
)default CHARSET=utf8;


desc cart;


