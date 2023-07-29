package stress

type PeriodicInterval struct {
	Length        int `json:"cycle_length"`    // ms
	ApiCallPeriod int `json:"api_call_period"` // ms
}
