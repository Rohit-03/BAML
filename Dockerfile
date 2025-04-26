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

# Generate the OpenAPI spec
RUN baml generate

# Expose the port BAML will run on (use PORT env var or default to 3000)
ENV PORT=3000
EXPOSE ${PORT}

# Create a health check endpoint
RUN echo 'const http = require("http"); const server = http.createServer((req, res) => { if (req.url === "/health") { res.writeHead(200); res.end("OK"); } else { res.writeHead(404); res.end(); } }); server.listen(8080);' > health.js

# Start the BAML server and health check
CMD ["sh", "-c", "node health.js & baml serve --host 0.0.0.0 --port ${PORT}"]