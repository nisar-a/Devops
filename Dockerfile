# Base image
FROM nginx:latest

# Copy the HTML file to NGINX default location
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
