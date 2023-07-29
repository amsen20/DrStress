package data

import (
	"fmt"
	"net/http"
)

type APIData struct {
	Url string `json:"endpoint"`
}

func (a *APIData) CallAPI() error {
	resp, err := http.Get(a.Url)
	if err != nil {
		return err
	}
	if resp.StatusCode != http.StatusOK {
		return fmt.Errorf("got status not OK")
	}

	return nil
}
