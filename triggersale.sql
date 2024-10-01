-- Disparador BEFORE INSERT para calcular subtotal_sale
CREATE OR REPLACE TRIGGER calc_subtotal_sale
BEFORE INSERT ON sale_detall
FOR EACH ROW
DECLARE
    v_price_sale NUMBER(8,2);
BEGIN
    -- Obtener el precio de venta del producto
    SELECT price_sale INTO v_price_sale
    FROM product
    WHERE id = :NEW.product_id;

    -- Calcular el subtotal
    :NEW.subtotal_sale := v_price_sale * :NEW.amount;
END;
/

-- Disparador AFTER INSERT y AFTER UPDATE para actualizar total_sale en la tabla sale
CREATE OR REPLACE TRIGGER update_total_sale
FOR INSERT OR UPDATE ON sale_detall
COMPOUND TRIGGER
    TYPE sale_id_list IS TABLE OF sale_detall.sale_id%TYPE;
    sale_ids sale_id_list := sale_id_list();
    
    BEFORE STATEMENT IS
    BEGIN
        sale_ids.DELETE;
    END BEFORE STATEMENT;
    
    AFTER EACH ROW IS
    BEGIN
        sale_ids.EXTEND;
        sale_ids(sale_ids.LAST) := :NEW.sale_id;
    END AFTER EACH ROW;
    
    AFTER STATEMENT IS
    BEGIN
        FOR i IN sale_ids.FIRST .. sale_ids.LAST LOOP
            UPDATE sale s
            SET s.total_sale = (
                SELECT SUM(sd.subtotal_sale)
                FROM sale_detall sd
                WHERE sd.sale_id = sale_ids(i)
            )
            WHERE s.id = sale_ids(i);
        END LOOP;
    END AFTER STATEMENT;
END;
/


-- Insertar datos de ejemplo en tabla sale
INSERT INTO sale (client_id, seller_id, payment_method_id)
VALUES (1, 13, 4);
SELECT * FROM SALE;

-- Insertar datos de ejemplo en tabla sale_detall
INSERT INTO sale_detall (sale_id, product_id, amount)
VALUES (19, 10, 5);
INSERT INTO sale_detall (sale_id, product_id, amount)
VALUES (19, 8, 10);
SELECT * FROM SALE_DETALL;

