-------------->>>>>Joins<<<<<
-->>Maestro
--Lista todos los productos junto a con su categoria
SELECT p.name AS product_name, c.name AS category_name
FROM product p
INNER JOIN category_product c ON p.category_product_id = c.id;

-->>Transaccional
--Reporte de compras
SELECT 
    p.id AS purchase_id,
    sup.name_company AS supplier,
    per.names || ' ' || per.last_name AS seller,
    p.date_time AS purchase_date,
    pd.product_id,
    pr.name AS product_name,
    pd.amount
FROM 
    purchase p
JOIN 
    supplier sup ON p.supplier_id = sup.id
JOIN 
    person per ON p.seller_id = per.id
JOIN 
    purchase_detall pd ON p.id = pd.purchase_id
JOIN 
    product pr ON pd.product_id = pr.id
ORDER BY 
    pd.purchase_id DESC;

--Reporte de Ventas
SELECT
    s.id AS sale_id,
    s.date_time AS sale_date,
    p_seller.names || ' ' || p_seller.last_name AS seller_name,
    p_client.names || ' ' || p_client.last_name AS client_name,
    p.name AS product_name,
    sd.amount AS quantity,
    p.price_sale AS unit_price,
    (sd.amount * p.price_sale) AS total_price
FROM
    sale s
    JOIN person p_seller ON s.seller_id = p_seller.id
    JOIN person p_client ON s.client_id = p_client.id
    JOIN sale_detall sd ON s.id = sd.sale_id
    JOIN product p ON sd.product_id = p.id
ORDER BY
     s.id, p_seller.names, p_client.names;

-------------->>>>>Where and parametros<<<<<
--<<Maestros
--listar clientes activos
SELECT id, type_document, number_document, names, last_name, cell_phone, email, birthdate 
FROM person 
WHERE rol_person = 'C' AND
active = 'A';
--. Productos en una Categoría Específica
SELECT 
    p.id,
    p.name,
    p.price_purchase,
    p.price_sale,
    p.stock
FROM 
    product p
JOIN 
    category_product cp ON p.category_product_id = cp.id
WHERE 
    cp.name = 'Abarrotes Secos';
    
----<<Transaccional
-- Detalle de una Venta Específica
SELECT 
    sale.id AS sale_id,
    person.names || ' ' || person.last_name AS client_name,
    product.name AS product_name,
    sale_detall.amount
FROM 
    sale
JOIN 
    sale_detall ON sale.id = sale_detall.sale_id
JOIN 
    product ON sale_detall.product_id = product.id
JOIN 
    person ON sale.client_id = person.id
WHERE 
    sale.id = 1;  -- ID específico de la venta
    
-- Reporte de Ventas Realizadas por un Vendedor
SELECT sa.id, sa.date_time, pe.names, pe.last_name, sa.active
FROM sale sa
JOIN person pe ON sa.seller_id = pe.id
WHERE pe.names = 'Carlos' AND pe.last_name = 'Gomez';


-------------->>>>>Agrupaciones y funciones<<<<<
--<<<Maestros>>>
--Calcula el total de personas
SELECT type_document, COUNT(*) AS total_persons
FROM person
GROUP BY type_document;

-- Reporte de Cantidad de Productos por Categoría:
SELECT cp.name AS category_name, COUNT(p.id) AS product_count
FROM category_product cp
LEFT JOIN product p ON cp.id = p.category_product_id
GROUP BY cp.name;

-- Concatenar el nombre y apellido de los clientes
SELECT id, CONCAT(names,last_name) AS full_name
FROM person
WHERE rol_person = 'C';
--la edad de los clientes en año
SELECT names, last_name, TRUNC(MONTHS_BETWEEN(SYSDATE, birthdate) / 12) AS age_years
FROM person
where rol_person= 'C';

--<<<Transaccional>>>
--Reporte de Ventas Totales por Vendedor
SELECT p.names || ' ' || p.last_name AS seller_name, COUNT(s.id) AS total_sales
FROM person p
JOIN sale s ON p.id = s.seller_id
GROUP BY p.names, p.last_name;

--Reporte de Compras Totales por Proveedor
SELECT s.name_company AS supplier_name, COUNT(p.id) AS total_purchases
FROM supplier s
JOIN purchase p ON s.id = p.supplier_id
GROUP BY s.name_company;


-------------------------------------------------------------------------------------------------------
-----------------------------------CONSULTAS PL/SQL

--------<<<<Procedimiento Almacenado>>>>
---Maestros
--Procedimiento para agregar un nuevo producto:
CREATE OR REPLACE PROCEDURE agregar_producto (
    product_name IN VARCHAR2,
    category_id IN INT,
    purchase_price IN DECIMAL,
    sale_price IN DECIMAL,
    expiry_date IN DATE,
    product_stock IN INT
) AS
BEGIN
    INSERT INTO product (name, category_product_id, price_purchase, price_sale, date_expiry, stock)
    VALUES (product_name, category_id, purchase_price, sale_price, expiry_date, product_stock);
    
    COMMIT;
END;

-- Llamada al procedimiento agregar_producto con los valores adecuados
BEGIN
    agregar_producto('Papa Amarilla', 1, 3.00, 4.00, TO_DATE('2025-12-31', 'YYYY-MM-DD'), 200);
END;

--Procedimiento para insertar un cliente
CREATE OR REPLACE PROCEDURE insertar_cliente (
    p_rol_person IN CHAR,
    p_type_document IN CHAR,
    p_number_document IN VARCHAR2,
    p_names IN VARCHAR2,
    p_last_name IN VARCHAR2,
    p_cell_phone IN CHAR,
    p_email IN VARCHAR2,
    p_birthdate IN DATE
) AS
BEGIN
    INSERT INTO person (
        rol_person, type_document, number_document, names, last_name, cell_phone, email, birthdate
    ) VALUES (
        p_rol_person, p_type_document, p_number_document, p_names, p_last_name, p_cell_phone, p_email, p_birthdate
    );
END;

-- Llamada al procedimiento insertar_ciente con los valores adecuados
BEGIN
    insertar_cliente('C', 'DNI', '78273849', 'Fernando', 'Huaman', '987233451', 'fernando@gmail.com', TO_DATE('2000-10-11', 'YYYY-MM-DD'));
END;


---Transaccional
--Procedimiento para cancelar una venta:
CREATE OR REPLACE PROCEDURE cancelar_venta (
    sale_id IN INT
) AS
BEGIN
    UPDATE sale
    SET active = 'I'
    WHERE id = sale_id;
    COMMIT;
END;
-- Llamada al procedimiento cancelar_venta con el ID de la venta
BEGIN
    cancelar_venta(1);
END;


--Procedimiento para cancelar una compra:
CREATE OR REPLACE PROCEDURE cancelar_compra (
    purchase_id IN INT
) AS
BEGIN
    UPDATE purchase
    SET active = 'I'
    WHERE id = purchase_id;
    
    COMMIT;
END;
-- Llamada al procedimiento cancelar_compra con el ID de la compra
BEGIN
    cancelar_compra(1); -- Suponiendo que el ID de la compra es 1
END;


