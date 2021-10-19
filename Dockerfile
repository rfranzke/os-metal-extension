#############      builder-base                             #############
FROM golang:1.16 AS builder
WORKDIR /work
COPY . .
# RUN go mod download
RUN make

#############      base                                     #############
FROM alpine:3.14 AS base
WORKDIR /
COPY charts /charts

COPY --from=builder /work/os-metal /os-metal
CMD ["/os-metal"]
