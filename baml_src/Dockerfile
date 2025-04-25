FROM node:18

# Install BAML globally
RUN npm install -g @boundaryml/baml

# Set the working directory
WORKDIR /app

# Copy everything into the container
COPY . .

# Expose the port BAML will run on
EXPOSE 3000

# Start the BAML server
CMD ["baml", "serve", "--host", "0.0.0.0", "--port", "3000"]