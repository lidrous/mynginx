# Use the official NGINX image from the Docker Hub
FROM nginx:latest

# Copy custom configuration file from the current directory
# to the NGINX configuration directory
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the content to be served by NGINX
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
