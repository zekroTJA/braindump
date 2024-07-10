# Cancel Loops via Context

Playground: https://go.dev/play/p/_wFt5EUBI8M

```go
package main

import (
	"context"
	"fmt"
	"time"
)

func loop(ctx context.Context) {
	i := 0
l:
	for {
		i++
		fmt.Println(i)
		time.Sleep(100 * time.Millisecond)

		select {
		case <-ctx.Done():
			break l
		default:
		}
	}
}

func main() {
	ctx, cancel := context.WithTimeout(context.Background(), 1*time.Second)
	go loop(ctx)

	time.Sleep(10 * time.Second)
	cancel()
}

```

