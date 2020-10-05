#1
CREATE OR REPLACE VIEW open_items AS
  SELECT vendor_name, invoice_number, invoice_total, invoice_total - payment_total - credit_total AS balance_due
    FROM vendors JOIN invoices
    ON vendors.vendor_id = invoices.vendor_id
    WHERE invoice_total - payment_total - credit_total  > 0
    ORDER BY vendor_name
	
	
#2
SELECT * FROM open_items
WHERE balance_due  > 1000


#3
CREATE VIEW vendor_address AS
  SELECT vendor_id, vendor_address1, vendor_address2
  FROM vendors
  
 #4
 UPDATE vendor_address 
   SET vendor_address2 = 'Ste 260' 
    ,vendor_address1 = '1990 Westwood Blvd'
  WHERE vendor_id = '4'

