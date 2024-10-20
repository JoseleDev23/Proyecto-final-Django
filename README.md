# 🏆 Gestión de Ligas Locales de Torremolinos

Este proyecto es una solución para la gestión de las ligas locales de Torremolinos, solicitado por el Patronato de Torremolinos. La aplicación permite gestionar instalaciones, equipos, jugadores y partidos, facilitando el seguimiento y organización de las competiciones deportivas.

## 🚀 Características

- **Gestión de Instalaciones**:
  - ➕ Añadir, ✏️ modificar y ❌ eliminar instalaciones.
  - Información detallada: nombre, dirección, iluminación y cobertura.

- **Gestión de Equipos**:
  - ➕ Añadir, ✏️ modificar y ❌ eliminar equipos.
  - Detalles del equipo: nombre, deporte, equipaciones y datos de contacto.

- **Gestión de Jugadores**:
  - ➕ Añadir, ✏️ modificar y ❌ eliminar jugadores.
  - Información del jugador: nombre, dorsal, fecha de nacimiento, altura, peso y teléfono de contacto.

- **Gestión de Partidos**:
  - ➕ Añadir, ✏️ modificar y ❌ eliminar partidos.
  - Información detallada: deporte, fecha, hora, instalación, equipos participantes y resultados.

- **Panel de Administración**:
  - 🛠️ Interfaz de gestión intuitiva incorporada por Django.
  - Opciones de búsqueda y filtrado en las tablas.

- **Página de Inicio**:
  - 📅 Listados de los cinco últimos partidos jugados y los cinco próximos partidos.
  - 🗂️ Acceso fácil a todas las funcionalidades mediante un menú de navegación.

## 📋 Requisitos

- Python 3.x
- Django
- MySQL
- Bootstrap (o similar para estilos)

## 📥 Instalación

1. Clona este repositorio:

   ```bash
   git clone https://github.com/JoseleDev23/Proyecto-final-Django.git
   cd Proyecto-final-Django

Crea un entorno virtual:

bash

python -m venv venv

Activa el entorno virtual:

En Windows:

bash
.\venv\Scripts\activate

En macOS/Linux:
bash

source venv/bin/activate

Instala las dependencias:
bash

pip install -r requirements.txt

Importa la base de datos desde torrolesport.sql:

Asegúrate de tener una base de datos creada en MySQL.

Usa el siguiente comando en la terminal de MySQL para importar el archivo:

sql

SOURCE /ruta/a/torrolesport.sql;

Configura la base de datos en settings.py de tu proyecto Django.

Realiza las migraciones:

bash

python manage.py migrate

Crea un superusuario para acceder al panel de administración:

bash

python manage.py createsuperuser

Ejecuta el servidor de desarrollo:

bash

python manage.py runserver

Accede a la aplicación en http://127.0.0.1:8000/ y al panel de administración en http://127.0.0.1:8000/admin/.

🌟 Opciones de Mejora

🔐 Implementación de inicio de sesión para acceso seguro al sitio web.

🎠 Carrusel de imágenes en la página de inicio.

⚽ Autocompletar el campo equipo al añadir un nuevo jugador.

🏅 Filtrado de equipos por deporte al crear o modificar partidos.

🔍 Mejoras en las opciones de búsqueda y filtrado en los listados de datos.

🤝 Contribuciones

Las contribuciones son bienvenidas. Si deseas colaborar, por favor crea un fork del repositorio y envía un pull request con tus cambios.

📝 Licencia
Este proyecto está licenciado bajo la Licencia MIT.

¡Gracias por visitar mi proyecto! Si tienes preguntas o comentarios, no dudes en contactarme.

markdown


### Instrucciones:

1. **Reemplaza** `/ruta/a/torrolesport.sql` con la ruta correcta donde se encuentra el archivo SQL en tu máquina.
2. **Asegúrate** de que el enlace al repositorio y otros enlaces estén correctamente configurados.



