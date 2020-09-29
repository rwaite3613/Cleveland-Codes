	
	Lesson 2
	
	#1 
	SELECT vendor_name, vendor_contact_first_name, vendor_contact_last_name 
	FROM `vendors` 
    ORDER BY vendor_contact_last_name, vendor_contact_first_name ASC

	#2
	SELECT CONCAT (vendor_contact_first_name, ', ', vendor_contact_last_name) AS full_name 
    FROM `vendors`

    WHERE vendor_contact_last_name LIKE 'A%'
	OR vendor_contact_last_name LIKE 'B%'
	OR vendor_contact_last_name LIKE 'C%' 
	OR vendor_contact_last_name LIKE 'E%'

	ORDER BY vendor_contact_last_name, vendor_contact_first_name ASC
	
	
	#3
	SELECT CONCAT(invoice_due_date) AS Due_Date, CONCAT (invoice_total) AS Invoice_Total, 
       invoice_total / 10 AS "10%",
       invoice_total * 1.1 AS "Plus 10%"
	FROM invoices
	WHERE invoice_total >= 500 AND invoice_total <= 1000
	ORDER BY invoice_due_date DESC


	#4
	SELECT invoice_number, invoice_total,
       payment_total + credit_total AS payment_credit_total,
       invoice_total - payment_total - credit_total AS balance_due
	FROM invoices
	WHERE invoice_total - payment_total - credit_total > 50
	ORDER BY balance_due DESC
	LIMIT 5;
	
	
	#5
	SELECT invoice_number, invoice_date, 
       invoice_total - payment_total - credit_total AS balance_due,
       payment_date
	FROM invoices
	WHERE payment_date IS NULL
	
	
	#6
	SELECT DATE_FORMAT(CURRENT_DATE, '%m-%d-%Y') AS "current_date"
	
	
	#7
	SELECT 50000 AS starting_principal,
	(ROUND (50000 * .065,2)) AS interest,
	(ROUND(50000 + 50000 * .065, 2)) AS principal_plus_interrest

	#8
	SELECT invoice_total
	FROM invoices
	WHERE invoice_date BETWEEN '2014-04-01' AND '2014-04-30'
	
	#9
	SELECT AVG(DATEDIFF(payment_date, invoice_date))
	FROM invoices
	WHERE invoice_date BETWEEN '2014-05-01' AND '2014-05-31'
	
	#1`0
	SELECT invoice_number, invoice_due_date, payment_date, 
	DATEDIFF(payment_date, invoice_due_date) AS average_days_late
	FROM invoices
	WHERE payment_date > invoice_due_date


	
	

