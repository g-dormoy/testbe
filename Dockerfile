# Multi stage docker file
#
# 1st stage is a builder, it's used to build the nodeJS application
# 2nd stage is a runner, it's used to run the nodeJS application
#
# This allow the usage of lighter docker image in production resulting on better startups
# Also, having only the requiered stuff to run the app avoid eventual threat on the security from useless services
#
#
# BUILDER PART
FROM --platform=linux/amd64 node:lts-gallium AS builder

# Built env
WORKDIR /app

# Copy only needed stuff to install. This is to take advantage on docker cache system
# Copy package.json and package-lock.json
COPY package*.json .
COPY prisma ./prisma/

# Install app dependencies
RUN npm install

# Copy the rest of the code for full build
COPY . .

# Build application
RUN npm run build

# RUNNER PART
FROM --platform=linux/amd64 node:lts-alpine AS runner

WORKDIR /app

# Copy the builds
COPY --from=builder /app/node_modules /app/node_modules
COPY --from=builder /app/package*.json /app/
COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/prisma ./prisma

# Expose the port form which the app listen
EXPOSE 3000

# Launch the app based on the environment
# To use the NODE_ENV env variable in the CMD we need to go by the shell
#   More details : this is explained here https://github.com/moby/moby/issues/5509
CMD ["sh", "-c", "npm run start:${NODE_ENV}"]
