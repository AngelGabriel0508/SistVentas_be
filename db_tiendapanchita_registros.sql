-------------------------------------------------
--------------- M A E S T R O S -----------------
-------------------------------------------------

-- Tabla: person(CLIENTE)
INSERT INTO person (rol_person, type_document, number_document, names, last_name, email, cell_phone, birthdate)
VALUES ('C','DNI', '76684851', 'Juan', 'Perez', 'juan@example.com', '938476253', TO_DATE('1990-01-01', 'YYYY-MM-DD'));
INSERT INTO person (rol_person, type_document, number_document, names, last_name, email, cell_phone, birthdate)
VALUES ('C','CNE', '87362533128394673843', 'Maria', 'Lopez', 'maria@example.com', '987654321', TO_DATE('1985-05-15', 'YYYY-MM-DD'));
INSERT INTO person (rol_person, type_document, number_document, names, last_name, email, cell_phone, birthdate)
VALUES ('C','DNI', '87362538', 'Pedro', 'Gomez', 'pedro@example.com', '982735183', TO_DATE('1993-10-20', 'YYYY-MM-DD'));
INSERT INTO person (rol_person, type_document, number_document, names, last_name, email, cell_phone, birthdate)
VALUES ('C','DNI', '98765432', 'Ana', 'Martinez', 'ana@example.com', '987654321', TO_DATE('1988-12-05', 'YYYY-MM-DD'));
INSERT INTO person (rol_person, type_document, number_document, names, last_name, email, cell_phone, birthdate)
VALUES ('C','DNI', '24681357', 'Luis', 'Rodriguez', 'luis@example.com', '982736481', TO_DATE('1995-03-25', 'YYYY-MM-DD'));
INSERT INTO person (rol_person, type_document, number_document, names, last_name, email, cell_phone, birthdate)
VALUES ('C','CNE', '76352413772833662831', 'Angel', 'Castilla', 'angel@example.com', '936609401', TO_DATE('2005-05-08', 'YYYY-MM-DD'));
INSERT INTO person (rol_person, type_document, number_document, names, last_name, email, cell_phone, birthdate)
VALUES ('C','DNI', '72638491', 'Diego', 'Ramos', 'diego@example.com', '982637481', TO_DATE('2001-09-19', 'YYYY-MM-DD'));
INSERT INTO person (rol_person, type_document, number_document, names, last_name, email, cell_phone, birthdate)
VALUES ('C','DNI', '72936123', 'Alex', 'Sanchez', 'alex@example.com', '982738412', TO_DATE('2003-06-28', 'YYYY-MM-DD'));
INSERT INTO person (rol_person, type_document, number_document, names, last_name, email, cell_phone, birthdate)
VALUES ('C','DNI', '65273941', 'Erick', 'Martinez', 'erick@example.com', '982738333', TO_DATE('1988-12-12', 'YYYY-MM-DD'));
INSERT INTO person (rol_person, type_document, number_document, names, last_name, email, cell_phone, birthdate)
VALUES ('C','DNI', '82730138', 'Luis', 'Tasayco', 'luis@example.com', '988273112', TO_DATE('2000-11-20', 'YYYY-MM-DD'));

--Listar completo tabla person
SELECT * FROM person;
--Listar clientes con todos los campos
SELECT * FROM person 
WHERE rol_person = 'C' AND
active = 'A';
--listar clientes
SELECT id, type_document, number_document, names, last_name, cell_phone, email, birthdate 
FROM person 
WHERE rol_person = 'C' AND
active = 'A';

-- Tabla: person(SELLER)
INSERT INTO person (rol_person, type_document, number_document, names, last_name, salary, cell_phone, email, seller_rol, seller_user, seller_password)
VALUES ('V','DNI', '37281936', 'Carlos', 'Gomez', 2000.00, '923456789', 'carlos@example.com', 'Empleado', 'carlo','cazador');
INSERT INTO person (rol_person, type_document, number_document, names, last_name, salary, cell_phone, email, seller_rol, seller_user, seller_password)
VALUES ('V','DNI', '52736153', 'Laura', 'Fernandez', 1800.00, '987654321', 'laura@example.com', 'Empleado', 'lfernandez', 'suerte');
INSERT INTO person (rol_person, type_document, number_document, names, last_name, salary, cell_phone, email, seller_rol, seller_user, seller_password)
VALUES ('V','DNI', '76352182', 'Marcos', 'Ruiz', 2200.00, '935792468', 'marcos@example.com', 'Empleado', 'flung', 'por100pre');
INSERT INTO person (rol_person, type_document, number_document, names, last_name, salary, cell_phone, email, seller_rol, seller_user, seller_password)
VALUES ('V','DNI', '73772813', 'Sofia', 'Garcia', 1900.00, '946813579', 'sofia@example.com', 'Empleado', 'sgarcia', 'hastalavista');
INSERT INTO person (rol_person, type_document, number_document, names, last_name, salary, cell_phone, email, seller_rol, seller_user, seller_password)
VALUES ('V','DNI', '53281233', 'Elena', 'Sanchez', 2100.00, '985792468', 'elena@example.com', 'Empleado', 'elenas', 'turuleka');
INSERT INTO person (rol_person, type_document, number_document, names, last_name, salary, cell_phone, email, seller_rol, seller_user, seller_password)
VALUES ('V','DNI', '63722834', 'Javier', 'López', 1950.00, '912233445', 'javier@example.com', 'Empleado', 'javierl', 'noimporta');
INSERT INTO person (rol_person, type_document, number_document, names, last_name, salary, cell_phone, email, seller_rol, seller_user, seller_password)
VALUES ('V','DNI', '73884991', 'Ana', 'Martínez', 2050.00, '954433221', 'ana@example.com', 'Empleado', 'amartinez', 'noselodigas');
INSERT INTO person (rol_person, type_document, number_document, names, last_name, salary, cell_phone, email, seller_rol, seller_user, seller_password)
VALUES ('V','DNI', '82739441', 'Pablo', 'González', 1300.00, '967788990', 'pablo@example.com', 'Empleado', 'pablogo', 'contraseñasegura');
INSERT INTO person (rol_person, type_document, number_document, names, last_name, salary, cell_phone, email, seller_rol, seller_user, seller_password)
VALUES ('V','DNI', '62339912', 'Lucía', 'Hernández', 1280.00, '988776655', 'lucia@example.com', 'Empleado', 'luciah', 'perdiste:v');
INSERT INTO person (rol_person, type_document, number_document, names, last_name, salary, cell_phone, email, seller_rol, seller_user, seller_password)
VALUES ('V','DNI', '82933312', 'Diego', 'Díaz', 1150.00, '912299887', 'diego@example.com', 'Empleado', 'diegor', 'caviar');

--INSERTAR ADMINISTRADORES
INSERT INTO person (rol_person, type_document, number_document, names, last_name, salary, cell_phone, email, seller_rol, seller_user, seller_password)
VALUES ('V','DNI', '98273654', 'Junior', 'Sandoval', 3000.00, '967788990', 'junior@example.com', 'Administrador', 'juniorS', 'teengañaron');
INSERT INTO person (rol_person, type_document, number_document, names, last_name, salary, cell_phone, email, seller_rol, seller_user, seller_password)
VALUES ('V','DNI', '98273843', 'Fernando', 'Ramirez', 2980.00, '988776655', 'fernando@example.com', 'Administrador', 'fernandoRa', 'noteenamores');
INSERT INTO person (rol_person, type_document, number_document, names, last_name, salary, cell_phone, email, seller_rol, seller_user, seller_password)
VALUES ('V','DNI', '88993364', 'Angel', 'Castilla', 2550.00, '912299887', 'angel@example.com', 'Administrador', 'angelCS', 'admin0508');

--Listar completo tabla person
SELECT * FROM person;
--Listar clientes con todos los campos
SELECT * FROM person 
WHERE rol_person = 'V' AND
active = 'A';
--listar clientes
SELECT id, type_document, number_document, names, last_name, cell_phone, email, salary, seller_user, seller_password
FROM person 
WHERE rol_person = 'V' AND
active = 'A';

-- Tabla: supplier
INSERT INTO supplier (ruc, name_company, type_document, number_document, names, last_name, email, cell_phone)
VALUES ('25367283912', 'San Fernando', 'DNI', '12345678', 'Jose', 'Perez', 'jose@example.com', '982739213');
INSERT INTO supplier (ruc, name_company, type_document, number_document, names, last_name, email, cell_phone)
VALUES ('25367489573', 'Coca-Cola', 'DNI', '87654321', 'Maria', 'Lopez', 'maria@example.com', '982733221');
INSERT INTO supplier (ruc, name_company, type_document, number_document, names, last_name, email, cell_phone)
VALUES ('18293748392', 'Pepsi', 'DNI', '98765432', 'Pedro', 'Gomez', 'pedro@example.com', '992831732');
INSERT INTO supplier (ruc, name_company, type_document, number_document, names, last_name, email, cell_phone)
VALUES ('67389843842', 'Dijisa SAC', 'CNE', '45678901', 'Ana', 'Martinez', 'ana@example.com', '998822371');
INSERT INTO supplier (ruc, name_company, type_document, number_document, names, last_name, email, cell_phone)
VALUES ('91837462121', 'Arinita SAC', 'DNI', '65432109', 'Luis', 'Rodriguez', 'luis@example.com', '928336733');
INSERT INTO supplier (ruc, name_company, type_document, number_document, names, last_name, email, cell_phone)
VALUES ('22337729371', 'Nestle', 'CNE', '23456789', 'Laura', 'Garcia', 'laura@example.com', '918228832');
INSERT INTO supplier (ruc, name_company, type_document, number_document, names, last_name, email, cell_phone)
VALUES ('91822773982', 'San Jose SAC', 'DNI', '87659321', 'Carlos', 'Sanchez', 'carlos@example.com', '991128331');
INSERT INTO supplier (ruc, name_company, type_document, number_document, names, last_name, email, cell_phone)
VALUES ('12938173512', 'Distribuidora SAC', 'DNI', '76543210', 'Elena', 'Fernandez', 'fernandez@example.com', '967788990');
INSERT INTO supplier (ruc, name_company, type_document, number_document, names, last_name, email, cell_phone)
VALUES ('29384477382', 'Almacen Rodriguez', 'CNE', '34567890', 'Juan', 'Lopez', 'lopez@example.com', '998877665');
INSERT INTO supplier (ruc, name_company, type_document, number_document, names, last_name, email, cell_phone)
VALUES ('1273821038', 'Mayorista García', 'DNI', '54321098', 'Sofia', 'Gomez', 'sofia@example.com', '922288772');

SELECT * FROM supplier;


-- Tabla: category_product
INSERT INTO category_product (name, description)
VALUES ('Abarrotes Secos', 'Productos no perecederos como arroz, frijoles, pasta, etc.');
INSERT INTO category_product (name, description)
VALUES ('Conservas', 'Alimentos enlatados como salsas, vegetales, frutas, etc.');
INSERT INTO category_product (name, description)
VALUES ('Bebidas', 'Refrescos, jugos, aguas, bebidas energéticas, etc.');
INSERT INTO category_product (name, description)
VALUES ('Panadería', 'Productos de panadería como pan, bollos, galletas, etc.');
INSERT INTO category_product (name, description)
VALUES ('Lácteos', 'Productos lácteos como leche, queso, yogurt, etc.');
INSERT INTO category_product (name, description)
VALUES ('Carnes y Embutidos', 'Carnes frescas y embutidos como salchichas, jamón, etc.');
INSERT INTO category_product (name, description)
VALUES ('Dulces y Snacks', 'Golosinas, chocolates, papas fritas, etc.');
INSERT INTO category_product (name, description)
VALUES ('Condimentos y Salsas', 'Especias, aderezos, salsas, etc.');
INSERT INTO category_product (name, description)
VALUES ('Artículos de Limpieza', 'Productos para la limpieza del hogar como detergentes, jabones, etc.');
INSERT INTO category_product (name, description)
VALUES ('Cuidado Personal', 'Productos de cuidado personal como champú, jabón de baño, etc.');

SELECT * FROM category_product;

-- Tabla: product
INSERT INTO product (code, name, description, category_product_id, price_unit, unit_sale, date_expiry, stock)
VALUES ('P001', 'Arroz Campo', 'Arroz de alta calidad', 1, 4.00, 'Kilo', TO_DATE('2025-12-31', 'YYYY-MM-DD'), 200);
INSERT INTO product (code, name, description, category_product_id, price_unit, unit_sale, date_expiry, stock)
VALUES ('P002', 'Frijol Bravo', 'Frijol natural y fresco', 1, 3.50, 'Kilo', TO_DATE('2025-12-31', 'YYYY-MM-DD'), 150);
INSERT INTO product (code, name, description, category_product_id, price_unit, unit_sale, date_expiry, stock)
VALUES ('P003', 'Azúcar Cristal', 'Azúcar refinada de alta pureza', 1, 4.50, 'Kilo', TO_DATE('2025-12-31', 'YYYY-MM-DD'), 100);
INSERT INTO product (code, name, description, category_product_id, price_unit, unit_sale, date_expiry, stock)
VALUES ('P004', 'Aceite Omega', 'Aceite vegetal puro', 1, 7.00, 'Unidad', TO_DATE('2025-12-31', 'YYYY-MM-DD'), 80);
INSERT INTO product (code, name, description, category_product_id, price_unit, unit_sale, date_expiry, stock)
VALUES ('P005', 'Sal Marina', 'Sal marina de grano fino', 1, 1.40, 'Unidad', TO_DATE('2025-12-31', 'YYYY-MM-DD'), 120);
INSERT INTO product (code, name, description, category_product_id, price_unit, unit_sale, date_expiry, stock)
VALUES ('P006', 'Atún A1', 'Atún enlatado de alta calidad', 2, 3.50, 'Unidad', TO_DATE('2025-12-31', 'YYYY-MM-DD'), 100);
INSERT INTO product (code, name, description, category_product_id, price_unit, unit_sale, date_expiry, stock)
VALUES ('P007', 'Leche Gloria', 'Leche evaporada enriquecida', 5, 2.80, 'Unidad', TO_DATE('2026-11-25', 'YYYY-MM-DD'), 120);
INSERT INTO product (code, name, description, category_product_id, price_unit, unit_sale, date_expiry, stock)
VALUES ('P008', 'Sopa instantánea', 'Sopa rápida de preparar', 2, 1.80, 'Unidad', TO_DATE('2025-10-21', 'YYYY-MM-DD'), 150);
INSERT INTO product (code, name, description, category_product_id, price_unit, unit_sale, date_expiry, stock)
VALUES ('P009', 'Jabón NEKKO', 'Jabón antibacterial', 9, 5.00, 'Unidad', TO_DATE('2025-08-11', 'YYYY-MM-DD'), 100);
INSERT INTO product (code, name, description, category_product_id, price_unit, unit_sale, date_expiry, stock)
VALUES ('P010', 'Bebida Energética Volt', 'Bebida energética revitalizante', 3, 2.50, 'Unidad', TO_DATE('2024-12-31', 'YYYY-MM-DD'), 120);

SELECT * FROM product;

-- Tabla: payment_method
INSERT INTO payment_method (name, description)
VALUES ('Efectivo', 'Pago en efectivo al momento de la compra.');
INSERT INTO payment_method (name, description)
VALUES ('Tarjeta de crédito', 'Pago con tarjeta de crédito.');
INSERT INTO payment_method (name, description)
VALUES ('Transferencia bancaria', 'Pago mediante transferencia bancaria.');
INSERT INTO payment_method (name, description)
VALUES ('Yape', 'Pago a través de la aplicación Yape.');
INSERT INTO payment_method (name, description)
VALUES ('Depósito bancario', 'Pago mediante depósito en cuenta bancaria.');

select * from payment_method;

---------------------------------------------------------------------
----------------------- T R I G G E R -------------------------------
---------------------------------------------------------------------
-- Crear el trigger para actualizar el stock después de una compra
CREATE OR REPLACE TRIGGER trg_update_stock_after_purchase
AFTER INSERT OR UPDATE ON purchase_detail
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
AFTER INSERT OR UPDATE ON sale_detail
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

-- Trigger para desactivar un producto si su stock se actualiza a cero
CREATE OR REPLACE TRIGGER desactivar_producto_al_actualizar_stock
AFTER UPDATE OF stock ON product
FOR EACH ROW
BEGIN
    -- Verificar si el nuevo stock del producto es igual a cero
    IF :NEW.stock = 0 THEN
        -- Actualizar el producto para establecerlo como inactivo
        UPDATE product
        SET active = 'I'
        WHERE id = :NEW.id;
    END IF;
END;
/

-- Trigger para desactivar un producto si se vende y no hay stock
CREATE OR REPLACE TRIGGER desactivar_producto_sin_stock
AFTER INSERT ON sale_detail
FOR EACH ROW
BEGIN
    IF :NEW.amount > 0 THEN
        UPDATE product
        SET active = 'I'
        WHERE id = :NEW.product_id
        AND stock = 0;
    END IF;
END;
/

-- Trigger para activar un producto si se compra y tiene stock
CREATE OR REPLACE TRIGGER activar_producto_con_stock
AFTER INSERT ON purchase_detail
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
/
-- Disparador BEFORE INSERT para calcular subtotal_purchase
CREATE OR REPLACE TRIGGER trg_calculate_subtotal_purchase
BEFORE INSERT OR UPDATE ON purchase_detail
FOR EACH ROW
BEGIN
    :NEW.subtotal_purchase := :NEW.amount * :NEW.price_unit;
END;
/

-- Disparador AFTER INSERT y AFTER UPDATE para actualizar total_purchase en la tabla purchase
CREATE OR REPLACE TRIGGER update_total_purchase
FOR INSERT OR UPDATE OR DELETE ON purchase_detail
COMPOUND TRIGGER
    TYPE purchase_id_list IS TABLE OF purchase_detail.purchase_id%TYPE;
    purchase_ids purchase_id_list := purchase_id_list();

    BEFORE STATEMENT IS
    BEGIN 
        purchase_ids.DELETE;
    END BEFORE STATEMENT;
    
    AFTER EACH ROW IS
    BEGIN
        IF DELETING THEN
            purchase_ids.EXTEND;
            purchase_ids(purchase_ids.LAST) := :OLD.purchase_id;
        ELSE
            purchase_ids.EXTEND;
            purchase_ids(purchase_ids.LAST) := :NEW.purchase_id;
        END IF;
    END AFTER EACH ROW;
    
    AFTER STATEMENT IS
    BEGIN
        FOR i IN purchase_ids.FIRST .. purchase_ids.LAST LOOP
            UPDATE purchase p
            SET p.total_purchase = (
                SELECT NVL(SUM(pd.subtotal_purchase), 0)
                FROM purchase_detail pd
                WHERE pd.purchase_id = purchase_ids(i)
            )
            WHERE p.id = purchase_ids(i);
        END LOOP;
    END AFTER STATEMENT;
END;
/

-- Disparador BEFORE INSERT para calcular subtotal_sale
CREATE OR REPLACE TRIGGER calc_subtotal_sale
BEFORE INSERT OR UPDATE ON sale_detail
FOR EACH ROW
DECLARE
    v_price_unit NUMBER(8,2);
BEGIN
    -- Obtener el precio de venta del producto
    SELECT price_unit INTO v_price_unit
    FROM product
    WHERE id = :NEW.product_id;

    -- Calcular el subtotal
    :NEW.subtotal_sale := v_price_unit * :NEW.amount;
END;
/

-- Disparador AFTER INSERT y AFTER UPDATE para actualizar total_sale en la tabla sale
CREATE OR REPLACE TRIGGER update_total_sale
FOR INSERT OR UPDATE OR DELETE ON sale_detail
COMPOUND TRIGGER
    TYPE sale_id_list IS TABLE OF sale_detail.sale_id%TYPE;
    sale_ids sale_id_list := sale_id_list();

    BEFORE STATEMENT IS
    BEGIN 
        sale_ids.DELETE;
    END BEFORE STATEMENT;
    
    AFTER EACH ROW IS
    BEGIN
        IF DELETING OR UPDATING THEN
            sale_ids.EXTEND;
            sale_ids(sale_ids.LAST) := :OLD.sale_id;
        END IF;
        
        IF INSERTING OR UPDATING THEN
            sale_ids.EXTEND;
            sale_ids(sale_ids.LAST) := :NEW.sale_id;
        END IF;
    END AFTER EACH ROW;
    
    AFTER STATEMENT IS
    BEGIN
        FOR i IN sale_ids.FIRST .. sale_ids.LAST LOOP
            UPDATE sale s
            SET s.total_sale = (
                SELECT NVL(SUM(sd.subtotal_sale), 0)
                FROM sale_detail sd
                WHERE sd.sale_id = sale_ids(i)
            )
            WHERE s.id = sale_ids(i);
        END LOOP;
    EXCEPTION
        WHEN OTHERS THEN
            NULL; -- Maneja cualquier excepción aquí
    END AFTER STATEMENT;
END;
/

CREATE OR REPLACE TRIGGER update_sale_date
BEFORE UPDATE ON sale
FOR EACH ROW
BEGIN
    :NEW.date_time := SYSDATE; -- Actualiza la fecha y hora a la hora de la edición
END;
/
CREATE OR REPLACE TRIGGER update_purchase_date
BEFORE UPDATE ON purchase
FOR EACH ROW
BEGIN
    :NEW.date_time := SYSDATE; -- Actualiza la fecha y hora a la hora de la edición
END;
/

---------------------------------------------------
------------ T R A S A C C I O N A L E S ----------
---------------------------------------------------

-- Tabla: purchase
INSERT INTO purchase (supplier_id, seller_id, payment_method_id)
VALUES (2, 11, 1);
INSERT INTO purchase (supplier_id, seller_id, payment_method_id)
VALUES (3, 16, 1);
INSERT INTO purchase (supplier_id, seller_id, payment_method_id)
VALUES (8, 12, 4);
INSERT INTO purchase (supplier_id, seller_id, payment_method_id)
VALUES (7, 14, 4);
INSERT INTO purchase (supplier_id, seller_id, payment_method_id)
VALUES (1, 11, 4);

SELECT * FROM purchase;

-- Tabla: purchase_detail
INSERT INTO purchase_detail (purchase_id, product_id, price_unit, amount)
VALUES (1, 6, 5.00, 10);
INSERT INTO purchase_detail (purchase_id, product_id, price_unit, amount)
VALUES (1, 7, 4.00, 10);
INSERT INTO purchase_detail (purchase_id, product_id, price_unit, amount)
VALUES (1, 2, 5.00, 10);
INSERT INTO purchase_detail (purchase_id, product_id, price_unit, amount)
VALUES (3, 8, 4.00,20);
INSERT INTO purchase_detail (purchase_id, product_id, price_unit, amount)
VALUES (3, 9, 6.50, 50);
INSERT INTO purchase_detail (purchase_id, product_id, price_unit, amount)
VALUES (5, 5, 2.00, 20);
INSERT INTO purchase_detail (purchase_id, product_id, price_unit, amount)
VALUES (5, 6, 5.00, 50);
INSERT INTO purchase_detail (purchase_id, product_id, price_unit, amount)
VALUES (2, 10, 3.50, 100);
INSERT INTO purchase_detail (purchase_id, product_id, price_unit, amount)
VALUES (4, 4, 9.00, 50);
INSERT INTO purchase_detail (purchase_id, product_id, price_unit, amount)
VALUES (4, 5, 2.00,10);

SELECT * FROM PURCHASE;
SELECT * FROM PURCHASE_DETAIL;
SELECT * FROM PRODUCT;


-- Tabla: sale
INSERT INTO sale (client_id, seller_id, payment_method_id)
VALUES (1, 13, 4);
INSERT INTO sale (client_id, seller_id, payment_method_id)
VALUES (2, 11, 4);
INSERT INTO sale (client_id, seller_id, payment_method_id)
VALUES (4, 11, 1);
INSERT INTO sale (client_id, seller_id, payment_method_id)
VALUES (5, 12, 1);
INSERT INTO sale (client_id, seller_id, payment_method_id)
VALUES (3, 15, 4);

SELECT * FROM sale;

-- Tabla: sale_detail
INSERT INTO sale_detail (sale_id, product_id, amount)
VALUES (1, 10, 5);
INSERT INTO sale_detail (sale_id, product_id, amount)
VALUES (1, 8, 10);
INSERT INTO sale_detail (sale_id, product_id, amount)
VALUES (3, 1, 5);
INSERT INTO sale_detail (sale_id, product_id, amount)
VALUES (3, 3, 3);
INSERT INTO sale_detail (sale_id, product_id, amount)
VALUES (5, 1, 3);
INSERT INTO sale_detail (sale_id, product_id, amount)
VALUES (2, 6, 5);
INSERT INTO sale_detail (sale_id, product_id, amount)
VALUES (2, 7, 5);
INSERT INTO sale_detail (sale_id, product_id, amount)
VALUES (2, 9, 10);
INSERT INTO sale_detail (sale_id, product_id, amount)
VALUES (4, 4, 5);
INSERT INTO sale_detail (sale_id, product_id, amount)
VALUES (4, 5, 2);
SELECT * FROM sale;
SELECT * FROM sale_detail;
SELECT * FROM product;
