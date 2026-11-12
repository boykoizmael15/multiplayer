# Party Arcade

Real-time multiplayer party games powered by Bun and WebSockets.

## Run locally

Install Bun and run:

```sh
bun run start
```

The server listens on `PORT` (defaults to 8080). Health check: `/health`. Multiplayer WebSockets: `/ws?room=ROOMCODE&name=PLAYER`.

## Render

Create a Web Service from this repository using the Docker runtime and the root `Dockerfile`. The website and WebSocket multiplayer server run in the same process.
