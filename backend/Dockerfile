FROM golang:1.17.0
COPY . /backend
WORKDIR /backend
RUN go build
EXPOSE 9000
CMD ["go", "run", "backend"]
