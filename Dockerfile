FROM ubuntu:latest AS builder
WORKDIR /work
COPY .out /out
RUN if [ "$(arch)" = "x86_64" ]; then \
        mv /out/moonphase-amd64 /binary; \
    else \
        mv /out/moonphase-arm64 /binary; \
    fi
FROM scratch
COPY --from=builder /binary /binary
ENTRYPOINT ["/binary"]
