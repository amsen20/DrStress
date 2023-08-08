package stress

import (
	"fmt"
	"net/http"
	"time"
)

type API struct {
	Name          string              `json:"name"`
	Endpoint      string              `json:"endpoint"`
	IntervalsData []*PeriodicInterval `json:"intervals"`
}

func (a *API) callAPI() error {
	resp, err := http.Get(a.Endpoint)
	if err != nil {
		return err
	}
	if resp.StatusCode != http.StatusOK {
		return fmt.Errorf("got status not OK, it is %d", resp.StatusCode)
	}

	return nil
}

func (a *API) StressAPI() {
	for _, intervalData := range a.IntervalsData {
		fmt.Printf("Starting stress test for %s\n", a.Name)
		fmt.Printf("API endpoint: %s\n", a.Endpoint)
		fmt.Printf("Interval: %f milliseconds\n", intervalData.Length)
		fmt.Printf("Period: %f milliseconds\n", intervalData.ApiCallPeriod)

		cycleDuration := time.Duration(intervalData.Length*1000) * time.Microsecond
		periodDuration := time.Duration(intervalData.ApiCallPeriod*1000) * time.Microsecond

		endPeriod := time.NewTimer(cycleDuration)
		periodicCallTimer := time.NewTimer(periodDuration)

	period:
		for {
			select {
			case <-periodicCallTimer.C:
				periodicCallTimer.Reset(periodDuration)
				err := a.callAPI()
				if err != nil {
					fmt.Printf("%s call faced following error:\n%s\n", a.Name, err.Error())
				} else {
					fmt.Printf("%s call OK\n", a.Name)
				}
			case <-endPeriod.C:
				fmt.Printf("finished %s", a.Name)
				break period
			}
		}
	}
}
