FROM node:18

# Install BAML globally with the correct version
RUN npm install -g @boundaryml/baml@0.85.0

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Install project dependencies if any
RUN if [ -f package.json ]; then npm install; fi

# Expose the port BAML will run on
EXPOSE 3000

# Start the BAML server
CMD ["npx", "baml", "serve", "--from", "./baml_src", "--host", "0.0.0.0", "--port", "3000"]
