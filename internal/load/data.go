package load

import (
	"amsen20/DrStress/internal/stress"
	"encoding/json"
	"io/ioutil"
)

type LoadData struct {
	APIs []*stress.API `json:"apis"`
}

func GetData(path string) (*LoadData, error) {
	ret := &LoadData{}
	content, err := ioutil.ReadFile(path)
	if err != nil {
		return nil, err
	}
	if err := json.Unmarshal(content, &ret); err != nil {
		return nil, err
	}

	return ret, nil
}
