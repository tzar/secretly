.PHONY: clean install test dist

clean:
	rm -rf dist

install:
	go get -u github.com/kardianos/govendor
	govendor sync

test:
	go test -coverprofile=coverage.out -v ./...

dist:
	mkdir dist
	GOOS=darwin GOARCH=amd64 CGO_ENABLED=0 go build -o dist/secretly-darwin-amd64
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o dist/secretly-linux-amd64
