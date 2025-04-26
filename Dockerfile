FROM node:18

WORKDIR /app

COPY . .

RUN npm install -g @boundaryml/baml@0.84.0

# Generate the server code based on your baml_src/ .baml files
RUN npx @boundaryml/baml generate

EXPOSE 3000

# Start the dev server after generation
CMD ["npx", "@boundaryml/baml", "dev", "--host", "0.0.0.0", "--port", "3000"]
