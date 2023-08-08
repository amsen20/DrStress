package stress

type PeriodicInterval struct {
	Length        float64 `json:"cycle_length"`    // ms
	ApiCallPeriod float64 `json:"api_call_period"` // ms
}
