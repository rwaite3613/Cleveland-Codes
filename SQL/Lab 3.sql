
#1
SELECT vendor_name, invoice_number, invoice_date, 
       invoice_total-payment_total-credit_total AS balace_due
FROM vendors v JOIN invoices i
     ON v.vendor_id = i.vendor_id
WHERE invoice_total-payment_total-credit_total > 0
ORDER BY vendor_name


#2
Select vendor_name, default_account_number AS default_account,
       account_description AS description
From vendors JOIN general_ledger_accounts
      ON vendors.default_account_number = 
          general_ledger_accounts.account_number
ORDER BY account_description, vendor_name
 
 
 #3
 SELECT vendor_name, invoice_date, invoice_number, 
       invoice_sequence, line_item_amount
FROM vendors v 
     JOIN invoices i
         ON v.vendor_id = i.vendor_id
     JOIN invoice_line_items li
          ON i.invoice_id = li.invoice_id
ORDER BY vendor_name, invoice_date, invoice_number, invoice_sequence
 
 #4
 SELECT invoice_id, gl.account_number, account_description 
FROM general_ledger_accounts gl
     LEFT JOIN invoice_line_items li
         ON gl.account_number = li.account_number
Where invoice_id IS NULL
ORDER BY account_number

 
 #5
 SELECT vendor_name, vendor_state
FROM vendors
WHERE vendor_state ='CA'
UNION 
SELECT vendor_name, 'outside CA' AS vendor_state
FROM vendors
WHERE vendor_state != 'CA' ORDER BY vendor_name
 