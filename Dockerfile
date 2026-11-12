FROM oven/bun:1
WORKDIR /app
COPY . .
ENV NODE_ENV=production
EXPOSE 8080
CMD ["bun", "run", "src/index.ts"]
