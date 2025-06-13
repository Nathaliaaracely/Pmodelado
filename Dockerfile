# Usa una imagen oficial de Python como base
FROM python:3.9-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia solo requirements.txt para instalar dependencias primero
COPY requirements.txt .

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto de los archivos
COPY . .

# Crea el directorio para la base de datos SQLite
RUN mkdir -p tmp

# Expone el puerto de la aplicación
EXPOSE 8000

# Comando para ejecutar la aplicación
CMD ["uvicorn", "playground:app", "--host", "0.0.0.0", "--port", "8000"]