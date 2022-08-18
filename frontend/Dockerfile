FROM golang:1.17.0
COPY . /frontend
WORKDIR /frontend
RUN go build
EXPOSE 8080
CMD ["go", "run", "frontend"]