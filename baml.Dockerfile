
# FROM node:20

# WORKDIR /app

# # Copy package files
# COPY package.json ./
# COPY baml_src/ ./baml_src/

# # Install dependencies
# RUN npm install
# RUN npm install -g @boundaryml/baml@latest

# # Set environment variables
# ENV PORT=2024
# ENV BAML_CORS_ORIGIN="*"

# # Use supported flags
# CMD ["npx", "baml-cli", "serve", "--from", "./baml_src", "--port", "2024"]
FROM node:20

# Install nginx
RUN apt-get update && apt-get install -y nginx

WORKDIR /app

# Copy package files
COPY package.json ./
COPY baml_src/ ./baml_src/

# Install dependencies
RUN npm install
RUN npm install -g @boundaryml/baml@latest

# Create nginx config template
RUN echo 'events { worker_connections 1024; }\
http {\
    server {\
        listen ${PORT};\
        location / {\
            proxy_pass http://localhost:2024;\
            proxy_http_version 1.1;\
            proxy_set_header Upgrade $http_upgrade;\
            proxy_set_header Connection "upgrade";\
            proxy_set_header Host $host;\
            proxy_cache_bypass $http_upgrade;\
            add_header "Access-Control-Allow-Origin" "*" always;\
            add_header "Access-Control-Allow-Methods" "GET, POST, OPTIONS" always;\
            add_header "Access-Control-Allow-Headers" "DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range,Authorization" always;\
            add_header "Access-Control-Expose-Headers" "Content-Length,Content-Range" always;\
            if ($request_method = "OPTIONS") {\
                add_header "Access-Control-Allow-Origin" "*";\
                add_header "Access-Control-Allow-Methods" "GET, POST, OPTIONS";\
                add_header "Access-Control-Allow-Headers" "DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range,Authorization";\
                add_header "Access-Control-Max-Age" 1728000;\
                add_header "Content-Type" "text/plain charset=UTF-8";\
                add_header "Content-Length" 0;\
                return 204;\
            }\
        }\
    }\
}' > /etc/nginx/nginx.template

# Set environment variables
ENV PORT=2024

# Start nginx with the correct port and baml server
CMD sh -c "envsubst '\$PORT' < /etc/nginx/nginx.template > /etc/nginx/nginx.conf && nginx && npx baml-cli serve --from ./baml_src --port 2024"
