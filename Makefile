all: hello.go hello.js

hello.go: hello.gojs Makefile
	cpp -DGO hello.gojs | grep -v '^#' > hello.go

hello.js: hello.gojs Makefile
	cpp hello.gojs | grep -v '^#' > hello.js

run: hello.js hello.go
	go run hello.go
	node hello.js
