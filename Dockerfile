FROM node:18

# Install BAML globally with the correct version
RUN npm install -g @boundaryml/baml@0.85.0

# Set the working directory
WORKDIR /app

# Copy everything into the container
COPY . .

# Generate server code
RUN npx @boundaryml/baml@0.85.0 generate

# Expose the port BAML will run on
EXPOSE 3000

# Start the BAML server
CMD ["baml", "serve", "--host", "0.0.0.0", "--port", "3000"]