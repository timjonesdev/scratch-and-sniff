package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	// Could/should make this configurable
	resp, err := http.Get("http://localhost:8080/health")

	fmt.Printf("Response Status: %v", resp.StatusCode)
	fmt.Println("")
	fmt.Println("...")

	if err != nil {
		fmt.Println("Error: Service Not Healthy")
		os.Exit(1)
	}
	// os.Exit(0) - happy
	if resp.StatusCode == http.StatusOK {
		fmt.Println("Service is Alive and Healthy")
		os.Exit(0)
	}
	// os.Exit(1) - sad
	fmt.Println("Service Not healthy")
	os.Exit(1)
}
