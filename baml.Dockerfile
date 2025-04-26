FROM node:20

WORKDIR /app

# Install BAML CLI globally
RUN npm install -g @boundaryml/baml

# Copy only the baml_src directory
COPY baml_src/ /app/baml_src/

# Start the BAML server directly from the baml_src directory
CMD ["baml-cli", "serve", "--from", "/app/baml_src", "--port", "2024"]
