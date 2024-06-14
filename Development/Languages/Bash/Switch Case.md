Switch case statement in bash.

# Example

```bash
case "$BRANCH" in

	"dev")
		DTAG="canary"
    ;;

	"master")
		DTAG="latest"
    ;;

	*)
	  exit 0
    ;;
esac
```