FROM rust:1.90-alpine AS build

WORKDIR /app
COPY . .

RUN apk add --no-cache musl-dev
RUN cargo build --release

FROM alpine:3.22.1

COPY --from=build /app/target/release/autobuild-ng /usr/bin

ENTRYPOINT [ "autobuild-ng" ]
