SOURCES := $(shell find . -name *.go)
PACKAGE_PATH:=github.com/solo-io/gloo/pkg/platform/kube

BINARY:=gloo-ingress-controller

build: $(BINARY)

$(BINARY): $(SOURCES)
	CGO_ENABLED=0 GOOS=linux go build -i -v  -o $@ *.go

docker: $(BINARY)
	docker build -t soloio/$(BINARY):v0.1 .

test:
	ginkgo -r -v .

clean:
	rm -f $(BINARY)
