PACKAGE = github.com/eric135/YaNFD
VERSION = 0.0.1
COMMIT != git rev-parse --short HEAD
DATE != date

.PHONY: all install clean test coverage

all: yanfd

yanfd: clean
	go build -ldflags "-X 'main.Version=${VERSION}-${COMMIT}' -X 'main.BuildTime=${DATE}'" ${PACKAGE}/cmd/yanfd

install:
	install -m 755 yanfd /usr/local/bin
	mkdir -p /usr/local/etc/ndn
	install -m 644 yanfd.toml /usr/local/etc/ndn

clean:
	rm -f yanfd coverage.out

test:
	go test ./... -coverprofile=coverage.out

coverage:
	go tool cover -html=coverage.out
