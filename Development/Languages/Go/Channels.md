# Channel Axioms

- A send to a nil channel blocks forever
- A receive from a nil channel blocks forever
- A send to a closed channel panics
- A receive from a closed channel returns the zero value immediately

# Sources

- https://dave.cheney.net/2014/03/19/channel-axioms