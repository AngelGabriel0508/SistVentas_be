-------------------------------------------------------------------------------------------------------
-----------------------------------CONSULTAS PL/SQL
--------------------------------------------
--------<<<<Procedimiento Almacenado>>>>
----///Maestros
-- Procedimiento para agregar un nuevo producto
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
/


-- Llamada al procedimiento agregar_producto con los valores adecuados
BEGIN
    agregar_producto('Papa Amarilla', 1, 3.00, 4.00, TO_DATE('2025-12-31', 'YYYY-MM-DD'), 200);
END;
/




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


---////Transaccional
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

-----------------------------------------
--------<<<<Funciones>>>>
--/////Maestros
--Obtener el Nombre Completo de una Persona
CREATE OR REPLACE FUNCTION obtener_nombre_completo_persona (
    p_id IN INT
) RETURN VARCHAR2 IS
    v_nombre_completo VARCHAR2(150);
BEGIN
    SELECT names || ' ' || last_name
    INTO v_nombre_completo
    FROM person
    WHERE id = p_id;

    RETURN v_nombre_completo;
END;
-- Obtener el nombre completo de la persona con ID 1
SELECT obtener_nombre_completo_persona(1) FROM DUAL;

-- Obtener el Precio de Venta de un Producto
CREATE OR REPLACE FUNCTION obtener_precio_venta_producto (
    p_id IN INT
) RETURN DECIMAL IS
    v_precio_venta DECIMAL(8,2);
BEGIN
    SELECT price_sale
    INTO v_precio_venta
    FROM product
    WHERE id = p_id;

    RETURN v_precio_venta;
END;
-- Obtener el precio de venta del producto con ID 1
SELECT obtener_precio_venta_producto(1) FROM DUAL;

--////Transaccional
--Obtener el Total de una Venta
CREATE OR REPLACE FUNCTION obtener_total_venta (
    p_sale_id IN INT
) RETURN DECIMAL IS
    v_total DECIMAL(8,2);
BEGIN
    SELECT SUM(sd.amount * p.price_sale)
    INTO v_total
    FROM sale_detall sd
    JOIN product p ON sd.product_id = p.id
    WHERE sd.sale_id = p_sale_id;

    RETURN v_total;
END;
-- Obtener el total de la venta con ID 1
SELECT obtener_total_venta(1) FROM DUAL;


-- Obtener el Total de una Compra
CREATE OR REPLACE FUNCTION obtener_total_compra (
    p_purchase_id IN INT
) RETURN DECIMAL IS
    v_total DECIMAL(8,2);
BEGIN
    SELECT SUM(pd.amount * p.price_purchase)
    INTO v_total
    FROM purchase_detall pd
    JOIN product p ON pd.product_id = p.id
    WHERE pd.purchase_id = p_purchase_id;

    RETURN v_total;
END;

-- Obtener el total de la compra con ID 1
SELECT obtener_total_compra(1) FROM DUAL;

---------------------------------------------------------------------
-------------------<<< Trigger >>>>-----------------------
--///Maestros
--Desactivar Producto sin Stock 
CREATE OR REPLACE TRIGGER desactivar_producto_sin_stock
AFTER INSERT ON sale_detall
FOR EACH ROW
BEGIN
    IF :NEW.amount > 0 THEN
        UPDATE product
        SET active = 'I'
        WHERE id = :NEW.product_id
        AND stock = 0;
    END IF;
END;

--Activar Producto con Stock 
CREATE OR REPLACE TRIGGER activar_producto_con_stock
AFTER INSERT ON purchase_detall
FOR EACH ROW
BEGIN
    -- Verificar si el nuevo stock del producto es mayor que cero
    IF :NEW.amount > 0 THEN
        -- Activar el producto si su stock cambió a más de cero
        UPDATE product
        SET active = 'A'
        WHERE id = :NEW.product_id
        AND active = 'I'; -- Solo activar si está desactivado
    END IF;
END;


--//Transaccional
-- Crear el trigger para actualizar el stock después de una compra
CREATE OR REPLACE TRIGGER trg_update_stock_after_purchase
AFTER INSERT OR UPDATE ON purchase_detall
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE product
        SET stock = stock + :NEW.amount
        WHERE id = :NEW.product_id;
    ELSIF UPDATING THEN
        UPDATE product
        SET stock = stock - (:OLD.amount - :NEW.amount)
        WHERE id = :NEW.product_id;
    END IF;
END;
/
-- Crear el trigger para actualizar el stock después de una venta
CREATE OR REPLACE TRIGGER trg_update_stock_after_sale
AFTER INSERT OR UPDATE ON sale_detall
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE product
        SET stock = stock - :NEW.amount
        WHERE id = :NEW.product_id;
    ELSIF UPDATING THEN
        UPDATE product
        SET stock = stock + (:OLD.amount - :NEW.amount)
        WHERE id = :NEW.product_id;
    END IF;
END;
/

---------------------------------------------------------------------
-------------------<<< Cursores >>>>-----------------------
--///Maestros
-- Cursor para Obtener Datos de Personas 
DECLARE
    CURSOR c_person IS
        SELECT id, names, last_name, email
        FROM person;
    v_id person.id%TYPE;
    v_names person.names%TYPE;
    v_last_name person.last_name%TYPE;
    v_email person.email%TYPE;
BEGIN
    OPEN c_person;
    LOOP
        FETCH c_person INTO v_id, v_names, v_last_name, v_email;
        EXIT WHEN c_person%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Nombre: ' || v_names || ' ' || v_last_name || ', Email: ' || v_email);
    END LOOP;
    CLOSE c_person;
END;
/

--Cursor para Obtener Datos de Productos
DECLARE
    CURSOR c_product IS
        SELECT id, name, price_sale, stock
        FROM product;
    v_id product.id%TYPE;
    v_name product.name%TYPE;
    v_price_sale product.price_sale%TYPE;
    v_stock product.stock%TYPE;
BEGIN
    OPEN c_product;
    LOOP
        FETCH c_product INTO v_id, v_name, v_price_sale, v_stock;
        EXIT WHEN c_product%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Nombre: ' || v_name || ', Precio Venta: ' || v_price_sale || ', Stock: ' || v_stock);
    END LOOP;
    CLOSE c_product;
END;
/

--///Transaccional
-- Cursor para Obtener Datos de Ventas
DECLARE
    CURSOR c_sale IS
        SELECT id, seller_id, client_id, date_time
        FROM sale;
    v_id sale.id%TYPE;
    v_seller_id sale.seller_id%TYPE;
    v_client_id sale.client_id%TYPE;
    v_date_time sale.date_time%TYPE;
BEGIN
    OPEN c_sale;
    LOOP
        FETCH c_sale INTO v_id, v_seller_id, v_client_id, v_date_time;
        EXIT WHEN c_sale%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Venta: ' || v_id || ', ID Vendedor: ' || v_seller_id || ', ID Cliente: ' || v_client_id || ', Fecha: ' || v_date_time);
    END LOOP;
    CLOSE c_sale;
END;
/



-- Cursor para Obtener Datos de Compras
DECLARE
    CURSOR c_purchase IS
        SELECT id, supplier_id, seller_id, date_time
        FROM purchase;
    v_id purchase.id%TYPE;
    v_supplier_id purchase.supplier_id%TYPE;
    v_seller_id purchase.seller_id%TYPE;
    v_date_time purchase.date_time%TYPE;
BEGIN
    OPEN c_purchase;
    LOOP
        FETCH c_purchase INTO v_id, v_supplier_id, v_seller_id, v_date_time;
        EXIT WHEN c_purchase%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Compra: ' || v_id || ', ID Proveedor: ' || v_supplier_id || ', ID Vendedor: ' || v_seller_id || ', Fecha: ' || v_date_time);
    END LOOP;
    CLOSE c_purchase;
END;
/


---------------------------------------------------------------------
-------------------<<< Paquetes >>>>-----------------------
--///Maestros
--Paquete para la tabla person
CREATE OR REPLACE PACKAGE person_pkg AS
    PROCEDURE obtener_personas;
END person_pkg;
/

CREATE OR REPLACE PACKAGE BODY person_pkg AS
    PROCEDURE obtener_personas AS
    BEGIN
        FOR person_rec IN (SELECT * FROM person) LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || person_rec.id || ', Nombre: ' || person_rec.names);
        END LOOP;
    END obtener_personas;
END person_pkg;
/
--Paquete para la tabla product
CREATE OR REPLACE PACKAGE product_pkg AS
    PROCEDURE obtener_productos;
END product_pkg;
/

CREATE OR REPLACE PACKAGE BODY product_pkg AS
    PROCEDURE obtener_productos AS
    BEGIN
        FOR product_rec IN (SELECT * FROM product) LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || product_rec.id || ', Nombre: ' || product_rec.name);
        END LOOP;
    END obtener_productos;
END product_pkg;
/
---///Transaccional
-- Paquete para la tabla sale
CREATE OR REPLACE PACKAGE sale_pkg AS
    PROCEDURE obtener_ventas;
END sale_pkg;
/

CREATE OR REPLACE PACKAGE BODY sale_pkg AS
    PROCEDURE obtener_ventas AS
    BEGIN
        FOR sale_rec IN (SELECT * FROM sale) LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || sale_rec.id || ', Fecha: ' || sale_rec.date_time);
        END LOOP;
    END obtener_ventas;
END sale_pkg;
/

--Paquete para la tabla purchase_detall
CREATE OR REPLACE PACKAGE purchase_detall_pkg AS
    PROCEDURE obtener_compras_detalle;
END purchase_detall_pkg;
/

CREATE OR REPLACE PACKAGE BODY purchase_detall_pkg AS
    PROCEDURE obtener_compras_detalle AS
    BEGIN
        FOR purchase_detall_rec IN (SELECT * FROM purchase_detall) LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || purchase_detall_rec.id || ', Compra ID: ' || purchase_detall_rec.purchase_id);
        END LOOP;
    END obtener_compras_detalle;
END purchase_detall_pkg;
/
