# 1️⃣ Usamos Java 25 sobre Alpine (liviano)
FROM eclipse-temurin:25-alpine

# 2️⃣ Etiqueta del responsable de la imagen
LABEL maintainer="user@udemedellin.edu.co"

# 3️⃣ Copiamos el .jar generado por Maven
COPY target/*.jar /home/spring-petclinic.jar

# 4️⃣ Comando para ejecutar la app cuando el contenedor arranca
CMD ["java","-jar","/home/spring-petclinic.jar"]

# 5️⃣ Exponemos el puerto de la aplicación
EXPOSE 8081
