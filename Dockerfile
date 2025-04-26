FROM node:18

# Install BAML globally with the correct version
RUN npm install -g @boundaryml/baml@0.85.0

# Set the working directory
WORKDIR /app

# Copy everything into the container
COPY . .

# Install any dependencies your project might need
# If you have a package.json file in your project
RUN if [ -f package.json ]; then npm install; fi

# Expose the port BAML will run on
EXPOSE 3000

# Start the BAML server without the generate step
CMD ["baml", "serve", "--host", "0.0.0.0", "--port", "3000"]