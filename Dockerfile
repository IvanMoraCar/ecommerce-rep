FROM python:3.10-slim

# Paso 1: Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    gcc \
    libmariadb-dev-compat \
    libmariadb-dev \
    pkg-config \
    && apt-get clean

# Paso 2: Crear el directorio del proyecto y establecer el directorio de trabajo
RUN mkdir /code
WORKDIR /code

# Paso 3: Copiar el archivo requirements.txt y instalar las dependencias de Python
COPY requirements.txt /code/
RUN pip install --no-cache-dir -r requirements.txt

# Paso 4: Copiar el resto del código del proyecto
COPY . /code/



