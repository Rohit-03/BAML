
# FROM node:20

# WORKDIR /app

# # Copy package files
# COPY package.json ./
# COPY baml_src/ ./baml_src/

# # Install dependencies with explicit paths
# RUN npm install
# RUN npm install -g @boundaryml/baml@latest

# # Verify installations and paths
# RUN npm list -g @boundaryml/baml
# RUN echo "Node version: $(node -v)"
# RUN echo "NPM version: $(npm -v)"

# # Use environment variable for port with fallback
# ENV PORT=2024

# # Start the BAML server using npx to ensure proper execution
# CMD ["npx", "baml-cli", "serve", "--port", "2024", "--cors"]
FROM node:20

WORKDIR /app

# Copy package files
COPY package.json ./
COPY baml_src/ ./baml_src/

# Install dependencies
RUN npm install
RUN npm install -g @boundaryml/baml@latest

# Set environment variables
ENV PORT=2024
ENV BAML_CORS_ORIGIN="*"

# Use supported flags
CMD ["npx", "baml-cli", "serve", "--from", "./baml_src", "--port", "2024"]
