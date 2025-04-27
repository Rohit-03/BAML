# # FROM node:20

# # WORKDIR /app

# # # Install BAML CLI globally
# # RUN npm install -g @boundaryml/baml

# # # Copy only the baml_src directory
# # COPY baml_src/ /app/baml_src/

# # # Start the BAML server directly from the baml_src directory
# # CMD ["baml-cli", "serve", "--from", "/app/baml_src", "--port", "2024"]

# FROM node:20

# WORKDIR /app

# # Copy package files
# COPY package.json ./
# COPY baml_src/ ./baml_src/

# # Install dependencies
# RUN npm install
# RUN npm install -g @boundaryml/baml

# # Use environment variable for port with fallback
# ENV PORT=2024

# # Start the BAML server
# CMD npx baml-cli serve --preview --port ${PORT:-2024}
FROM node:20

WORKDIR /app

# Copy package files
COPY package.json ./
COPY baml_src/ ./baml_src/

# Install dependencies with explicit paths
RUN npm install
RUN npm install -g @boundaryml/baml@latest

# Verify installations and paths
RUN npm list -g @boundaryml/baml
RUN echo "Node version: $(node -v)"
RUN echo "NPM version: $(npm -v)"

# Use environment variable for port with fallback
ENV PORT=2024

# Start the BAML server using npx to ensure proper execution
CMD ["npx", "baml-cli", "serve", "--port", "2024"]
