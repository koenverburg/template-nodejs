FROM node:16-alpine AS base

WORKDIR /app

RUN npm install -g pnpm

COPY . .
RUN pnpm install -r --frozen-lockfile && rm -rf ~/.pnpm-store

FROM base AS builder
ARG NODE_ENV=production
RUN pnpm build

FROM base AS runner

COPY --from=base /app/node_modules ./node_modules
# COPY --from=base /app/.env .env
COPY --from=builder /app/bin/index.js ./bin/index.js

CMD ["pnpm", "start:prod"]
