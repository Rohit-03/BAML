# BAML API Server

This repository contains a BAML API server that can be deployed to Render.

## Local Development

To run the server locally:

```bash
# Generate the OpenAPI spec
baml generate

# Start the server
baml serve --host 0.0.0.0 --port 3000
```

## Deploying to Render

### Option 1: Using the Render Dashboard

1. Create a new Web Service on Render
2. Connect your repository
3. Select "Docker" as the environment
4. Set the following environment variables in the Render dashboard:
   - Any API keys or credentials that are in your local `.env` file
5. Click "Create Web Service"

### Option 2: Using render.yaml (Recommended)

1. Push the repository with the `render.yaml` file to GitHub
2. Go to the Render dashboard and select "Blueprint" when creating a new service
3. Connect your repository
4. Render will automatically detect the `render.yaml` file and configure your service

## Health Check

The API includes a health check endpoint at `/health` that returns a 200 OK response.

## Important Notes

- Make sure all required environment variables are set in the Render dashboard
- The server runs on port 3000 by default, but will use the PORT environment variable if set
- The OpenAPI spec is generated during the build process
