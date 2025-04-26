FROM node:18

WORKDIR /app

COPY . .

# Install specific BAML version
RUN npm install -g @boundaryml/baml@0.84.0

# Generate server code
RUN npx @boundaryml/baml generate

EXPOSE 3000

# Start dev server
CMD ["npx", "@boundaryml/baml", "dev", "--host", "0.0.0.0", "--port", "3000"]
