FROM golang:1.17.7-alpine AS build

WORKDIR /go/src

COPY . . 

RUN go mod init exemple/desafiogo

RUN go build 

FROM scratch as execute

WORKDIR /go/src

COPY --from=build /go/src/desafiogo .

CMD ["./desafiogo"]
