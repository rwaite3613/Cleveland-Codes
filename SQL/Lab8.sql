#1
DELIMITER //

CREATE PROCEDURE test()
BEGIN
  DECLARE invoice_count   INT;

  SELECT COUNT(*)
    INTO invoice_count
    FROM invoices
  WHERE invoice_total - payment_total - credit_total >= 5000;
  
  SELECT CONCAT(invoice_count, ' invoices exceed $5000.') AS message;
END//

DELIMITER ;

CALL test();


#2
DELIMITER //

CREATE FUNCTION factorial_10
(
   input_num INT
)
RETURNS INT
BEGIN
  DECLARE i    INT DEFAULT 1;
  DECLARE fact INT DEFAULT 1;

  WHILE i <= input_num DO
    SET fact = fact * i;
    SET i = i + 1;
  END WHILE;
  
  RETURN fact;

END//

DELIMITER ;

SELECT factorial_10(10) AS fact10;


#3
DELIMITER //

CREATE PROCEDURE insert_glaccount
(
  account_number_param        INT,   
  account_description_param   VARCHAR(50)
)
BEGIN
  INSERT INTO general_ledger_accounts
  VALUES (account_number_param, account_description_param);
END//

DELIMITER ;

--I used your examples

-- Test fail: 
CALL insert_glaccount(700, 'Cash');

-- Test success: 
CALL insert_glaccount(700, 'Internet Services');

-- Clean up: 
DELETE FROM general_ledger_accounts WHERE account_number = 700;


#4
DELIMITER //
CREATE FUNCTION test_glaccounts_description
(
   account_description_param VARCHAR(50)
)
RETURNS INT
BEGIN

DECLARE row_count INT;

SELECT count(*) INTO row_count
FROM general_ledger_accounts gl
WHERE gl.account_description = account_description_param;

IF row_count = 0 THEN
   RETURN FALSE;
ELSE
   RETURN TRUE;
END IF;

END//


#5
DELIMITER // 

CREATE FUNCTION change_to_currency
(value VARCHAR(25))
RETURNS VARCHAR (25)

BEGIN

   DECLARE currency VARCHAR (25);

    IF value > 0 THEN
        SET currency = CONCAT('$', FORMAT(value, 2));

    ELSEIF value < 0 THEN
        SET currency = CONCAT('($', FORMAT(value, 2),')');

    ELSE SET currency = ('$0.00');

    END IF;

    RETURN currency;
 
END //
