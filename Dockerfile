FROM python:3.9-slim
FROM node:18

WORKDIR /app

# Instalar dependencias del sistema necesarias
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiar solo lo necesario (mejor práctica)
COPY requirements.txt .
COPY playground.py .

# Instalar dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Crear directorio para la base de datos


# Puerto expuesto (Cloud Run usa 8080)
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["python", "playground.py"]