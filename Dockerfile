FROM docker.kodality.com/fsh-builder:latest as builder

WORKDIR /fsh
COPY ig ./
RUN ./_updatePublisher.sh -y
RUN ./_genonce.sh

FROM nginx:1.21-alpine
COPY etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /fsh/output /usr/share/nginx/html/ig-mpi
