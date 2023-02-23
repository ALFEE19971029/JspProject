
CREATE TABLE IF NOT EXISTS `order`(
		o_id int auto_increment,
		name VARCHAR(50) NOT NULL,
		zipCode VARCHAR(10) NOT NULL,
		addressName VARCHAR(50) NOT NULL,
		country VARCHAR(20) NOT NULL,
		shippingDate VARCHAR(15) NOT NULL,
		c_id VARCHAR(50	) NOT NULL,
		p_id VARCHAR(10) NOT NULL,
		p_name VARCHAR(20),
		p_unitPrice  INTEGER,
		c_quantity  INTEGER,
		c_total INTEGER,
		PRIMARY KEY (o_id)
)default CHARSET=utf8;




