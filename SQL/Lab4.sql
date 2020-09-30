  LAB 4
  
 #1
	INSERT INTO invoices VALUES
	(DEFAULT, 32, 'AX-014-027', '2014-08-01', 434.48, 0.00, 0.00, 2, '2014-08-31', NULL)

#2
INSERT INTO invoice_line_items VALUES 
      (115, 1, 160, 180.23, 'Hard Drive'),
      (115, 2, 527, 254.35, 'Exchange Server Update')


#3
UPDATE invoices
SET credit_total = invoice_total * .1,
 payment_total = invoice_total - credit_total,
payment_date = NOW()
WHERE invoice_id = 115


#4
UPDATE vendors
SET default_account_number = 403
WHERE vendor_id = 44


#5
DELETE FROM invoice_line_items
WHERE invoice_id = 115;
      (SELECT invoice_id
       FROM invoices
       WHERE invoice_id = '115');