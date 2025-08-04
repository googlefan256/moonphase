FROM ubuntu:latest AS builder
WORKDIR /work
COPY .out /out
RUN if [ "$(arch)" = "x86_64" ]; then \
        mv /out/moonphaze-amd64 /moonphaze; \
    else \
        mv /out/moonphaze-arm64 /moonphaze; \
    fi
FROM scratch
COPY --from=builder /moonphaze /moonphaze
ENTRYPOINT ["/moonphaze"]
