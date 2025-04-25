FROM node:18

# Install BAML globally
RUN npm install -g @boundaryml/baml

# Make sure /usr/local/bin is in the PATH
ENV PATH="/usr/local/bin:${PATH}"

# Set working directory
WORKDIR /app

# Copy your BAML files
COPY . .

# Expose the port
EXPOSE 3000

# Start BAML server
CMD ["baml", "serve", "--host", "0.0.0.0", "--port", "3000"]