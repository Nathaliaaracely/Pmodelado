#usa una imagen oficial de Python como base
FROM python:3.9-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de la aplicación
COPY . .

# Instala las dependencias
RUN pip install -r requirements.txt && \
    pip install --no-cache-dir groq
# Instala las dependencias de Groq


# Expone el puerto de la aplicación
EXPOSE 8000

# Comando para ejecutar la aplicación
CMD ["python", "playground.py"]