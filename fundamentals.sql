---RUTH GALVAN
-- 1. Procedimiento para activar un cliente:
CREATE OR REPLACE PROCEDURE activar_producto (
    producto_id IN INT
) AS
BEGIN
    UPDATE product
    SET active = 'A'
    WHERE id = producto_id;
    COMMIT;
END;
-- Llamada al procedimiento activar_producto con el ID del producto
BEGIN
    activar_producto(1); -- Suponiendo que el ID del producto es 1
END;

--2.Procedimiento para desactivar un proveedor:
CREATE OR REPLACE PROCEDURE desactivar_proveedor (
    supplier_id IN INT
) AS
BEGIN
    UPDATE supplier
    SET active = 'I'
    WHERE id = supplier_id;
    
    COMMIT;
END;
-- Llamada al procedimiento desactivar_proveedor con el ID del proveedor
BEGIN
    desactivar_proveedor(1); -- Suponiendo que el ID del proveedor es 1
END;

--3. Procedimiento para agregar un nuevo producto:
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


--4 Procedimiento para cancelar una compra:
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

--5 Función para obtener el precio de compra de un producto:
CREATE OR REPLACE FUNCTION obtener_precio_compra (
    product_id IN INT
) RETURN NUMBER AS
    precio_compra NUMBER;
BEGIN
    SELECT price_purchase INTO precio_compra
    FROM product
    WHERE id = product_id;
    
    RETURN precio_compra;
END;

SELECT obtener_precio_compra(1) FROM DUAL;

-----ANGEL GABRIEL CASTILLA SANDOVAL

--6 Procedimiento para registrar una nueva categoría de producto:
CREATE OR REPLACE PROCEDURE agregar_categoria_producto (
    category_name IN VARCHAR2,
    category_description IN VARCHAR2
) AS
BEGIN
    INSERT INTO category_product (name, description)
    VALUES (category_name, category_description);
    
    COMMIT;
END;
-- Llamada al procedimiento agregar_categoria_producto
BEGIN
    agregar_categoria_producto('Utiles', 'Utiles escolares para el regreso al cole');
END;


--7. Procedimiento para aumentar el stock de un producto:
CREATE OR REPLACE PROCEDURE aumentar_stock (
    p_product_id IN INT,
    p_amount IN INT
) AS
BEGIN
    UPDATE product
    SET stock = stock + p_amount
    WHERE id = p_product_id;
    COMMIT;
END;
-- Llamada al procedimiento aumentar_stock con ID del producto 1 y cantidad 20
BEGIN
    aumentar_stock(1, 20);
END;


--8. Procedimiento para desactivar un producto:
CREATE OR REPLACE PROCEDURE desactivar_producto (
    producto_id IN INT
) AS
BEGIN
    UPDATE product
    SET active = 'I'
    WHERE id = producto_id;
    COMMIT;
END;
-- Llamada al procedimiento desactivar_producto con el ID del producto
BEGIN
    desactivar_producto(1);
END;


--9 Procedimiento para activar un person:
CREATE OR REPLACE PROCEDURE activar_person (
    person_id IN INT
) AS
BEGIN
    UPDATE person
    SET active = 'A'
    WHERE id = person_id;
    
    COMMIT;
END;
-- Llamada al procedimiento activar_person con el ID de la persona
BEGIN
    activar_person(1);
END;

--10Procedimiento para cancelar una venta:
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




