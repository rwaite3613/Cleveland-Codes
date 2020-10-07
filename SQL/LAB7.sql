#1

SELECT vendor_id, ROUND(SUM(invoice_total - payment_total - credit_total),2)
    AS total_balance_due
FROM invoices 
GROUP BY vendor_id
ORDER BY  total_balance_due DESC


#2
SELECT payment_total, vendor_name, COUNT(*), 
    SUM(payment_total) AS 'Total Payments'
FROM vendors v JOIN invoices i 
ON v.vendor_id = i.vendor_id
GROUP BY vendor_name 
ORDER BY vendor_name DESC

#3
SELECT payment_total, vendor_name, COUNT(*), 
    SUM(payment_total) AS 'Total Payments'
FROM vendors JOIN invoices
GROUP BY payment_total
ORDER BY vendor_name DESC

#4
SELECT account_description, COUNT(invoice_id) AS li_cnt, 
SUM(line_item_amount) li_sum
FROM invoice_line_items
JOIN general_ledger_accounts
USING (account_number)
GROUP BY account_number
HAVING li_cnt > 1
ORDER BY line_item_amount DESC


#5
SELECT account_description, COUNT(*) AS li_cnt, 
SUM(line_item_amount) li_sum
FROM  general_ledger_accounts gl 
   JOIN invoice_line_items li
    ON gl.account_number = li.account_number
   JOIN invoices i 
    ON li.invoice_id = i.invoice_id
WHERE invoice_date BETWEEN '2014-04-01' AND '2014-06-30'
GROUP BY account_description
HAVING li_cnt > 1
ORDER BY li_sum DESC

#6
SELECT account_number
FROM invoice_line_items
GROUP BY account_number WITH ROLLUP

#7
SELECT vendor_name,
      COUNT(DISTINCT li.account_number) AS number_of_accounts
FROM vendors v 
   JOIN invoices i 
     ON v.vendor_id = i.vendor_id
   JOIN invoice_line_items li 
     ON i.invoice_id = li.invoice_id
GROUP BY vendor_name
HAVING number_of_accounts > 1

