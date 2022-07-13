

SELECT
         cast(customerid AS int) AS codigo_cliente
       , cast(personid AS int) AS codigo_pessoa
       , cast(storeid AS int) AS codigo_empresa
       , cast(territoryid AS int) AS codigo_territorio
       , cast(modifieddate AS date) AS data_modificacao       
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`sales_customer`