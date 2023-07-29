package stress

import (
	"fmt"
	"net/http"
	"time"
)

type API struct {
	Name          string              `json:"name"`
	Url           string              `json:"endpoint"`
	IntervalsData []*PeriodicInterval `json:"intervals"`
}

func (a *API) callAPI() error {
	resp, err := http.Get(a.Url)
	if err != nil {
		return err
	}
	if resp.StatusCode != http.StatusOK {
		return fmt.Errorf("got status not OK")
	}

	return nil
}

func (a *API) StressAPI() {
	for _, intervalData := range a.IntervalsData {
		cycleDuration := time.Duration(intervalData.Length) * time.Millisecond
		periodDuration := time.Duration(intervalData.ApiCallPeriod) * time.Millisecond

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
				}
			case <-endPeriod.C:
				break period
			}
		}
	}
}
