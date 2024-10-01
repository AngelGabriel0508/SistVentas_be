# 🗄️ Base de Datos del Sistema de Ventas para Tienda Panchita

Este repositorio contiene los scripts SQL necesarios para la creación de la base de datos, las relaciones entre las tablas, la inserción de datos de prueba y la generación de reportes utilizando **JasperReports**. La base de datos ha sido diseñada para trabajar con **Oracle** y se incluye todo lo necesario para configurar y poblar la base de datos para el **Sistema de Ventas para Tienda Panchita**.

## 📋 Contenido

El repositorio contiene los siguientes archivos:

- `schema.sql`: Contiene el script para la creación de las tablas y sus relaciones.
- `data.sql`: Contiene los scripts de inserción de datos (clientes, productos, ventas, etc.).
- `reports`: Carpeta que incluye los archivos `.jrxml` para la generación de reportes con **JasperReports**.

## 🛠️ Configuración de la Base de Datos

### Creación del Esquema y las Tablas

1. Asegúrate de tener **Oracle Database** instalado y configurado en tu entorno local o remoto.
2. Ejecuta el script `schema.sql` para crear todas las tablas necesarias en la base de datos. Esto incluye tablas maestras y transaccionales para gestionar clientes, productos, ventas, proveedores, y más.

#### Estructura de las Tablas

El archivo `schema.sql` crea las siguientes tablas y relaciones:

- **Tablas Maestras**:
  - `person`: Información de clientes y vendedores.
  - `supplier`: Información de los proveedores.
  - `category_product`: Categorías de productos.
  - `product`: Detalles de productos como nombre, precio, stock y vencimiento.
  - `payment_method`: Métodos de pago.

- **Tablas Transaccionales**:
  - `purchase`: Registro de compras realizadas a proveedores.
  - `purchase_detail`: Detalles de los productos comprados.
  - `sale`: Registro de ventas realizadas a los clientes.
  - `sale_detail`: Detalles de los productos vendidos.

#### Relación entre las Tablas

- Cada **producto** está vinculado a una **categoría**.
- Cada **venta** y **compra** tiene un detalle asociado que especifica los productos comprados o vendidos.
- Los **clientes** están relacionados con las **ventas**, y los **proveedores** con las **compras**.

3. Para ejecutar el script, usa tu herramienta de administración de Oracle Database (como **SQL*Plus**, **SQL Developer**, o cualquier cliente JDBC compatible).

```bash
sqlplus ANGEL/123456789@localhost/XE @schema.sql
