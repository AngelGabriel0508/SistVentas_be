# 🏪 Sistema de Ventas para Tienda Panchita

¡Bienvenidos al repositorio del **Sistema de Ventas para Tienda Panchita**! Este proyecto ha sido desarrollado para proporcionar una solución integral que simplifique y optimice la gestión de ventas y compras en la tienda.

## 🌟 Descripción del Proyecto

El **Sistema de Ventas para Tienda Panchita** es una aplicación diseñada para facilitar el proceso de ventas y administración en una tienda local. Este sistema cuenta con un **backend** robusto desarrollado en **Spring Boot**, que gestiona todas las operaciones críticas y se conecta a una base de datos **Oracle**. La arquitectura del sistema está diseñada para ser eficiente y escalable, asegurando un rendimiento óptimo tanto en entornos locales como en configuraciones autónomas.

### 🛠️ Tecnologías Utilizadas

- **Backend:**
  - **Spring Boot:** Se utiliza para construir un servidor RESTful que gestiona la lógica de negocio, las operaciones de acceso a datos y la comunicación con el frontend.
  - **Oracle Database:** Esta potente base de datos se utiliza para almacenar toda la información crítica relacionada con clientes, proveedores, productos y transacciones.
  - **IDE JetBrains:** Se utiliza este entorno de desarrollo para crear y gestionar el backend, aprovechando sus características avanzadas para mejorar la productividad.

- **Frontend:**
  - **Angular:** El frontend está construido con Angular, un marco de trabajo robusto que permite crear aplicaciones web dinámicas y eficientes.
  - **Visual Studio:** Este IDE se utiliza para el desarrollo del frontend, proporcionando una interfaz intuitiva y herramientas útiles para optimizar el flujo de trabajo.

### 📊 Estructura del Sistema

El sistema está organizado en dos componentes principales: el backend y el frontend, que interactúan para proporcionar una experiencia de usuario fluida y eficiente. La base de datos Oracle se utiliza para gestionar tanto la información maestra como transaccional, incluyendo:

#### Tablas Maestras:
- **Clientes:** Almacena la información de los clientes, facilitando la gestión de sus datos y transacciones.
- **Vendedores:** Contiene información sobre los vendedores responsables de las ventas.
- **Proveedores:** Registra los datos de los proveedores que suministran productos a la tienda.
- **Categorías de Productos:** Define las categorías de los productos disponibles en la tienda.

#### Tablas Transaccionales:
- **Ventas:** Registra cada transacción de venta, incluyendo detalles del cliente y vendedor.
- **Detalle de Ventas:** Almacena la información específica de los productos vendidos en cada transacción.
- **Compras:** Registra las compras realizadas a proveedores.
- **Detalle de Compras:** Contiene la información detallada de los productos adquiridos en cada compra.

## 🚀 Funcionalidades Principales

- **Gestión de Clientes y Vendedores:** Añadir, editar y eliminar información de clientes y vendedores de manera sencilla.
- **Control de Proveedores:** Administrar los datos de los proveedores que abastecen la tienda.
- **Clasificación de Productos:** Organizar productos en categorías para una fácil navegación y gestión.
- **Registro de Ventas y Compras:** Facilitar la realización de transacciones y mantener un registro detallado de todas las actividades comerciales.
- **Interfaz Dinámica:** Ofrecer una experiencia de usuario interactiva y responsiva a través del frontend desarrollado en Angular.

## 📦 Clonacion

Para clonar el proyecto en tu entorno local, sigue estos pasos:

1. **Clona el repositorio:**
   ```bash
   git clone https://github.com/AngelGabriel0508/Sistema_Ventas.git

## 🛠️ Configuración

### Configura la base de datos local de Oracle

Si deseas ejecutar el sistema con una base de datos Oracle local, asegúrate de que Oracle Database esté instalado y configurado. Luego, modifica el archivo `application.properties` en tu proyecto de Spring Boot con la siguiente configuración:
    ```properties
    
    spring.application.name=sistventas
    server.port=8080

    # Configuraciones de Oracle
    spring.datasource.url=jdbc:oracle:thin:@localhost:1521/XE
    spring.datasource.username=ANGEL
    spring.datasource.password=123456789
    spring.datasource.driver-class-name=oracle.jdbc.OracleDriver
    
### Configura el entorno autónomo con Wallets

Si deseas ejecutar el sistema utilizando un Wallet de Oracle, asegúrate de tener la carpeta `Wallet_SistemaVentas` configurada correctamente. Luego, modifica el archivo `application.properties` de la siguiente manera:
    ```properties
    
    server.port=8080
    server.servlet.context-path=/
    spring.application.name=sistventas

    # Configuraciones de Oracle usando Wallet
    spring.datasource.url=jdbc:oracle:thin:@sistemaventas_medium?TNS_ADMIN=Wallet_SistemaVentas
    spring.datasource.username=panchita
    spring.datasource.password=soyAngelDB2024
    spring.datasource.driver-class-name=oracle.jdbc.OracleDriver

### Agrega la carpeta de Wallets al proyecto

Asegúrate de incluir la carpeta `Wallet_SistemaVentas` en la raíz de tu proyecto de Spring Boot. Esta carpeta debe contener los archivos necesarios para la conexión con la base de datos mediante el Wallet.

### Ejecuta el backend

Navega hasta el directorio del backend y ejecuta el siguiente comando para iniciar el servidor Spring Boot:
    ```bash
    
    cd backend
    mvn spring-boot:run

### Ejecuta el frontend

Si tienes el frontend desarrollado en Angular, dirígete al directorio del frontend y ejecuta el siguiente comando para iniciar el servidor Angular:
    ```bash
    
    cd frontend
    ng serve
