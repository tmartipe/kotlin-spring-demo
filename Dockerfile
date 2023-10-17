# Use the official OpenJDK 21 image as a parent image
FROM adoptopenjdk:11-jre-hotspot

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file of your Spring Boot application into the container
COPY target/endpoints-demo-0.0.1-SNAPSHOT.jar app.jar

# Expose the port that your Spring Boot application will run on
EXPOSE 8080

# Set environment variables, if needed
# ENV SPRING_PROFILES_ACTIVE=production

# Define a Docker entry point to run your Spring Boot application
CMD ["java", "-jar", "app.jar"]