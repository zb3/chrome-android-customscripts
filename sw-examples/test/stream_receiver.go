package main

import (
	"fmt"
	"io"
	"net/http"
)

func main() {
	handler := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("okay, callet")

		if r.URL.Path != "/" {
			http.Error(w, http.StatusText(http.StatusNotFound), http.StatusNotFound)
			return
		}

		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Content-Type", "text/plain; charset=utf-8")
		w.Header().Set("X-Content-Type-Options", "nosniff")
		w.WriteHeader(http.StatusOK)

		defer r.Body.Close()

		//this must work..., but will it?
		fmt.Fprintln(w, "Starte")

		buff := make([]byte, 128)
		for {
			n, err := r.Body.Read(buff[:])

			if n > 0 {
				fmt.Println(buff[:n])
				w.Write(buff[:n])
			}

			if err == io.EOF {
				break
			}
		}

		fmt.Fprintln(w, "Hello, World!")
	})

	s := &http.Server{
		Addr:    ":5000",
		Handler: handler,
	}
	s.ListenAndServeTLS("host.crt", "host.key")
	fmt.Println("lo")
}
