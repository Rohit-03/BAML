FROM node:18

WORKDIR /app

COPY . .

RUN npm install -g @boundaryml/baml

EXPOSE 3000

CMD ["npx", "@boundaryml/baml", "dev", "--host", "0.0.0.0", "--port", "3000"]
