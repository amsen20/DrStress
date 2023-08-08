build default: 
	go build -o stress main.go

stress: 
	make default
	./stress --path ./scenario.json

clean:
	rm -rf stress
