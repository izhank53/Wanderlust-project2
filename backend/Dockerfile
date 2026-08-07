FROM node:22-alpine

WORKDIR /app 

RUN npm install -g npm@latest

# package.json contains the dependencies for the application
COPY package*.json ./ 

# Install the dependencies from package.json
RUN npm ci

# now copy the rest of the application code into the container for the backend
COPY . .

EXPOSE 5000

# after npm install the container is created and now we can start the app , after copying the rest of the app code 
CMD ["npm", "start" ]
