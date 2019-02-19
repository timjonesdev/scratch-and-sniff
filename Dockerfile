# -------------------------------------------------------
# Build the go source
# -------------------------------------------------------
FROM docker.io/golang:1.11 as go-builder

# copy simple go application into the container
COPY sniff.go $GOPATH/src/app/sniff.go
# change the working directory, for convenience
WORKDIR $GOPATH/src/app
# build the Go binary and create some directories to copy in later stages
RUN CGO_ENABLED=0 go build -o /go/bin/sniff ./sniff.go && \
    echo "Sniff Binary built"
    
# -------------------------------------------------------
# Add the Go binary to scratch to create an enhanced base image
# -------------------------------------------------------
FROM scratch

# copy source files from go-builder stage into the scratch container
COPY --from=go-builder /go/bin/sniff /health