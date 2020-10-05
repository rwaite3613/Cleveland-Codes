CREATE Table customers
   (customer_id  INT NOT NULL UNIQUE AUTO_INCREMENT  PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL  UNIQUE,
    customer_address1 VARCHAR(50) NOT NULL UNIQUE,
    customer_address2 VARCHAR(50),
    customer_city  VARCHAR(50)  NOT NULL,
    customer_state  CHAR(2) NOT NULL,
    customer_zip    VARCHAR(10) NOT NULL,
    customer_phone  VARCHAR(50) NOT NULL,
    customer_contact_last_name  VARCHAR(50) NOT NULL,
    customer_contact_first_name    VARCHAR(50)  NOT NULL,
    
	
	)
	
	
	CREATE TABLE cust_invoices
	(cust_invoice_id   INT   NOT NULL   UNIQUE   AUTO_INCREMENT,
     customer_id     INT   NOT NULL,
     invoice_number VARCHAR(50)	NOT NULL ,
     invoice_date  DATE   NOT NULL,
	 invoice_total  decimal (9,2)  NOT NULL  DEFAULT '0.00',
     payment_total   decimal (9,2)NOT NULL   DEFAULT '0.00',
     credit_total    decimal (9,2)   DEFAULT  '0.00',
     terms_id     INT (11),   
     invoice_due_date   DATE   NOT NULL,
     payment_date   DATE,
	 CONSTRAINT  cust_invoices_pk   PRIMARY KEY  (cust_invoice_id)
   )


   CREATE TABLE account_supplies
   (customer_id INT NOT NULL,
    supplies_monthly_total  decimal (9,2)   DEFAULT '0.00',
    leased_equipment    VARCHAR(50)    DEFAULT '0.00',
    leased_equipment monthly_total   decimal (9,2) DEFAULT '0.00',
	total_supply_and_equip   decimal (9,2)  DEFAULT  '0.00'
    )

  CREATE TABLE  employees
  (employee_id INT  NOT NULL    AUTO_INCREMENT   PRIMARY KEY, 
   employee_last_name VARCHAR(50)  NOT NULL,
   employee_first_name  VARCHAR(50) NOT NULL,
   employee_type   CHAR (2)  NOT NULL,
   employee_title  VARCHAR (50)  NOT NULL,
   employee_salaried_pay  decimal (9,2)  DEFAULT  '0.00',
   employee_hourly_rate   decimal (9,2)  DEFAULT  '0.00',
   employee_address1  VARCHAR(50)  NOT NULL,
   employee_address2 VARCHAR(50),
   employee_city    VARCHAR(50)  NOT NULL,
   employee_state   CHAR(2)   NOT NULL,
   employee_zip  VARCHAR (10)  NOT NULL,
   employee_phone VARCHAR (50)  NOT NULL,
   employee_email   VARCHAR (50)
  )
  
  CREATE TABLE profit_loss
  (customer_id NOT NULL,
   total_payroll   decimal (9,2)  NOT NULL,
   total_taxes_and_insurance   decimal (9,2)  NOT NULL,
   total_equip_and_supplies    decimal (9,2)  NOT NULL,
   gross_profit        decimal (9,2)  NOT NULL,
   administrative_cost   decimal (9,2)   NOT NULL,
   net_profit    decimal (9,2)  NOT NULL
  )

	