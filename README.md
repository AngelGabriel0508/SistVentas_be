# 🛠️ Backend del Sistema de Ventas para Tienda Panchita

Este repositorio contiene el código fuente del backend del **Sistema de Ventas para Tienda Panchita**, construido con **Spring Boot** y utilizando una base de datos **Oracle**. El backend gestiona toda la lógica de negocio, el acceso a datos, y las operaciones RESTful necesarias para interactuar con el frontend y otras partes del sistema.

## 📋 Requisitos

Antes de comenzar, asegúrate de tener lo siguiente instalado en tu máquina:

- **Java 11+**
- **Maven 3.6+**
- **Oracle Database** (o utilizar Wallets de Oracle)
- **Spring Boot 2.6+**

## 🛠️ Configuración

### Configura la base de datos local de Oracle

Si deseas ejecutar el sistema con una base de datos Oracle local, sigue estos pasos:

1. Asegúrate de que Oracle Database esté instalado y en ejecución.
2. Crea un esquema o usa uno existente para almacenar los datos del sistema.
3. Abre el archivo `src/main/resources/application.properties` en tu proyecto de Spring Boot y agrega o modifica la configuración con los siguientes parámetros:

    ```properties
    spring.application.name=sistventas
    server.port=8080

    # Configuraciones de Oracle
    spring.datasource.url=jdbc:oracle:thin:@localhost:1521/XE
    spring.datasource.username=ANGEL
    spring.datasource.password=123456789
    spring.datasource.driver-class-name=oracle.jdbc.OracleDriver

    # Configuración adicional para Hibernate (opcional)
    spring.jpa.hibernate.ddl-auto=update
    spring.jpa.show-sql=true
    spring.jpa.properties.hibernate.format_sql=true
    spring.jpa.database-platform=org.hibernate.dialect.Oracle12cDialect
    ```

Esta configuración se conecta a una instancia local de Oracle (XE) y utiliza las credenciales proporcionadas. Modifica el `username`, `password` y `url` según tu configuración.

### Configura el entorno autónomo con Wallets

Si prefieres ejecutar el sistema usando un **Wallet de Oracle**, sigue estos pasos:

1. Asegúrate de tener la carpeta `Wallet_SistemaVentas` correctamente configurada. Esta carpeta debe contener los archivos necesarios para la conexión segura a Oracle Autonomous Database.
2. Modifica el archivo `application.properties` como sigue:

    ```properties
    server.port=8080
    server.servlet.context-path=/
    spring.application.name=sistventas

    # Configuración de Oracle usando Wallet
    spring.datasource.url=jdbc:oracle:thin:@sistemaventas_medium?TNS_ADMIN=Wallet_SistemaVentas
    spring.datasource.username=panchita
    spring.datasource.password=soyAngelDB2024
    spring.datasource.driver-class-name=oracle.jdbc.OracleDriver

    # Configuración adicional para Hibernate (opcional)
    spring.jpa.hibernate.ddl-auto=update
    spring.jpa.show-sql=true
    spring.jpa.properties.hibernate.format_sql=true
    spring.jpa.database-platform=org.hibernate.dialect.Oracle12cDialect
    ```

### Agrega la carpeta de Wallets al proyecto

- Coloca la carpeta `Wallet_SistemaVentas` en la raíz de tu proyecto backend.
- Verifica que los archivos en la carpeta del Wallet estén configurados correctamente y tengan permisos de acceso adecuados para que Spring Boot pueda conectarse al servicio de Oracle Autonomous Database.

## 🚀 Ejecución del Backend

Una vez configurado todo, puedes iniciar el servidor backend de Spring Boot con el siguiente comando desde la raíz del proyecto:

```bash
mvn spring-boot:run
