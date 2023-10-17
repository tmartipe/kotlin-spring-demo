# Use the official OpenJDK 21 image as a parent image
FROM eclipse-temurin:17.0.8.1_1-jre-jammy AS builder

# Install Maven
RUN apt-get update && \
    apt-get install -y maven

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files (pom.xml) to the container
COPY pom.xml .

# Download and resolve the dependencies, effectively caching them
RUN mvn dependency:go-offline -B

# Copy the rest of the application source code to the container
COPY src src

# Build the Maven project
RUN mvn package -DskipTests

# Create a production-ready JAR file
RUN mv target/*.jar app.jar

# Use a smaller base image to create the final image
FROM  eclipse-temurin:17.0.8.1_1-jre-jammy

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file built in the previous stage
COPY --from=builder /app/app.jar .

# Expose the port that your Spring Boot application will run on
EXPOSE 8080

# Set environment variables, if needed
# ENV SPRING_PROFILES_ACTIVE=production

# Define a Docker entry point to run your Spring Boot application
CMD ["java", "-jar", "app.jar"]