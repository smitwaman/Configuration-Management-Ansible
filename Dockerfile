# Use an official Nginx runtime as the base image
FROM nginx:latest

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy the custom Nginx configuration file to replace the default one
COPY nginx.conf /etc/nginx/conf.d/

# Copy the static files (e.g., HTML, CSS, JS) of your Java web application to the Nginx web root directory
COPY src/ /usr/share/nginx/html/

# Expose port 8080 to allow external access
EXPOSE 8080

# Command to start Nginx when the container is launched
CMD ["nginx", "-g", "daemon off;"]

