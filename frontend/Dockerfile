
#stage 1 
FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json ./ 

RUN npm ci

COPY . .

#belwo command builds the application for production and store the output in the dist folder
RUN npm run build 

#stage 2    
FROM nginx:alpine AS runner

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]