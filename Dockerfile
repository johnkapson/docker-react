# BUILD phase

# includes npm, which we need to install dependencies
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
#RUN ["npm", "run", "build"]
# /app/build will have all we care about

# RUN phase

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# default command of image starts nginx for us