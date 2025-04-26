FROM node:18

WORKDIR /app

# Install BAML CLI and TypeScript compiler
RUN npm install -g @boundaryml/baml@0.84.0 typescript openapi-generator-cli

# Copy entire project
COPY . .

# Generate server code only (NOT client SDK again)
RUN npx @boundaryml/baml generate --no-on-generate

# Build the generated server code
RUN cd baml_src/server && npm install && npx tsc

EXPOSE 3000

# Start production server
CMD ["npx", "baml", "serve", "--from", "./baml_src", "--host", "0.0.0.0", "--port", "3000"]
