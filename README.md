# 🌐 Frontend del Sistema de Ventas para Tienda Panchita

Este repositorio contiene el código fuente del frontend para el **Sistema de Ventas para Tienda Panchita**, desarrollado utilizando **Angular**. Este frontend se conecta a la API REST desarrollada en **Spring Boot** para gestionar productos, clientes, ventas, proveedores y otros módulos relacionados con el sistema de ventas.

## 📋 Contenido

El repositorio incluye las siguientes carpetas y archivos importantes:

- `src/app/`: Contiene los componentes, servicios, modelos y módulos del frontend.
- `src/assets/`: Archivos de recursos estáticos como imágenes, fuentes y archivos de estilo.
- `src/environments/`: Archivos de configuración para diferentes entornos (desarrollo y producción).

## 🚀 Funcionalidades Principales

El frontend incluye las siguientes funcionalidades:

- Gestión de clientes (alta, baja, modificación y consulta).
- Gestión de productos (consulta de inventario, productos por vencer, y productos en stock bajo).
- Registro de ventas (selección de productos, cálculo de totales y detalles de las ventas).
- Gestión de proveedores (alta, baja y modificación).
- Consulta de ventas y reportes de ventas.
- Generación de reportes en formato PDF y Excel (utilizando **JasperReports** en el backend).

## 📦 Requisitos Previos

Asegúrate de tener instalados los siguientes programas en tu entorno de desarrollo:

- **Node.js** (versión 14 o superior)
- **Angular CLI** (versión 12 o superior)
- **NPM** (gestor de paquetes de Node.js)

Para instalar **Angular CLI**, si no lo tienes instalado:

```bash
npm install -g @angular/cli
