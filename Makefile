build default: 
	make clean
	go build -o stress main.go

low: 
	make default
	./stress --path scenarios/low.json

mid: 
	make default
	./stress --path scenarios/mid.json

hard: 
	make default
	./stress --path scenarios/hard.json

clean:
	rm -rf stress
