# Finance System 💰

Sistema de gestión financiera full-stack diseñado para el control y análisis de finanzas personales/empresariales.

## 🛠️ Stack Tecnológico

### Backend
- **Lenguaje:** Python 3.13
- **Framework:** Django
- **Gestión de Paquetes:** [uv](https://github.com/astral-sh/uv) (Fast Python package installer and resolver)
- **Base de Datos:** PostgreSQL 17

### Frontend
- **Framework:** Next.js 16 (React 19)
- **Lenguaje:** TypeScript
- **Estilos:** Tailwind CSS 4
- **Gestión de Paquetes:** pnpm

### Infraestructura
- **Contenedores:** Docker & Docker Compose

## 📂 Estructura del Proyecto

```text
Finance_system/
├── app/                    # Backend Django (Lógica de negocio y API)
│   └── finance/             # Proyecto Django
│       ├── finance/          # Configuración del proyecto Django
│       └── manage.py         # Utilidad de gestión de Django
├── mi-app-next/            # Frontend Next.js (Interfaz de usuario)
├── src/                    # Módulo raíz de Python (convención uv)
├── .env                    # Variables de entorno (No subir al repositorio)
├── Dockerfile              # Configuración de imagen para Backend
├── docker-compose.yml       # Orquestación de servicios (DB, Backend, Frontend)
└── pyproject.toml          # Definición de dependencias de Python
```

## 📋 Requisitos Previos

Para ejecutar este proyecto localmente, necesitas tener instalado:
- [Docker](https://www.docker.com/) y [Docker Compose](https://docs.docker.com/compose/)
- [pnpm](https://pnpm.io/) (Opcional, solo para desarrollo local sin Docker en frontend)
- [uv](https://github.com/astral-sh/uv) (Opcional, solo para desarrollo local sin Docker en backend)

## 🚀 Inicio Rápido

### 1. Configuración de Entorno
Crea un archivo `.env` en la raíz del proyecto con las siguientes variables:
```env
POSTGRES_DB=finance_db
POSTGRES_USER=user
POSTGRES_PASSWORD=password
DATABASE_URL=postgres://user:password@db:5432/finance_db
DEBUG=1
```

### 2. Despliegue con Docker
Ejecuta el siguiente comando para levantar todos los servicios:
```bash
docker-compose up --build
```

Los servicios estarán disponibles en:
- **Frontend:** `http://localhost:3000`
- **Backend (Django):** `http://localhost:8000`
- **Base de Datos:** `localhost:5432`

## 🛠️ Desarrollo

### Backend
Para ejecutar migraciones o crear superusuarios dentro del contenedor:
```bash
docker exec -it finance-backend python app/finance/manage.py migrate
docker exec -it finance-backend python app/finance/manage.py createsuperuser
```

### Frontend
El frontend está configurado en modo desarrollo con hot-reloading activo mediante volúmenes de Docker.