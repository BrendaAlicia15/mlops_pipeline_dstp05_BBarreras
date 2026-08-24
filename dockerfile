# ---------------------------
# 1. Imagen base
# ---------------------------
FROM python:3.11-slim

# ---------------------------
# 2. Set working directory
# ---------------------------
WORKDIR /app

# ---------------------------
# 3. Copiar requirements
# ---------------------------
COPY requirements.txt .

# ---------------------------
# 4. Instalar dependencias
# ---------------------------
RUN pip install --no-cache-dir -r requirements.txt

# ---------------------------
# 5. Copiar proyecto
# ---------------------------
COPY . .

# 6.  Agrega esta línea para que reconozca la carpeta src como parte del path
ENV PYTHONPATH=/app/src

# ---------------------------
# 7. Exponer puerto
# ---------------------------
EXPOSE 8000

# ---------------------------
# 8. Comando de arranque
# ---------------------------
#CMD ["uvicorn", "src.model_deploy:app", "--host", "0.0.0.0", "--port", "8000"]
CMD ["uvicorn", "src.model_deploy:app", "--host", "0.0.0.0", "--port", "8000"]