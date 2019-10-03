FROM golang AS compilando

WORKDIR /app
ADD . /app
RUN go build -o meugo


FROM alpine
WORKDIR /giropops
COPY --from=compilando /app/meugo /giropops
ENTRYPOINT ./meugo
