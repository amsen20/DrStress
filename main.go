package main

import (
	"amsen20/DrStress/internal/load"
	"amsen20/DrStress/internal/stress"
	"flag"
	"fmt"
	"sync"
)

func main() {
	pathPtr := flag.String("path", "", "path to stress load data")
	flag.Parse()

	loadData, err := load.GetData(*pathPtr)
	if err != nil {
		fmt.Printf("could not start stressing due to following error: %s\n", err.Error())
	}

	var wg sync.WaitGroup
	for _, API := range loadData.APIs {
		wg.Add(1)
		go func(api *stress.API) {
			defer wg.Done()
			api.StressAPI()
		}(API)
	}
	wg.Wait()
}
