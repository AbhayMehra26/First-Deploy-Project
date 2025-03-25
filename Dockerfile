# Use an official Java runtime as a base image
FROM eclipse-temurin:17-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven wrapper and project files into the container
COPY . /app

# Give execution permission to Maven wrapper
RUN chmod +x mvnw

# Build the application, skipping tests for faster builds
RUN ./mvnw clean package -DskipTests

# Run the built JAR file
CMD ["java", "-jar", "target/TelegramBot-9-0.0.1-SNAPSHOT.jar"]

