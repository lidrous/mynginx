# Use the official NGINX image from the Docker Hub
FROM nginx:latest

# Copy the content to be served by NGINX
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]

