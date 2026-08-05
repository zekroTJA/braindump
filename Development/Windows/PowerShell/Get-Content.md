`Get-Content` is a [[PowerShell]] command comparable to `cat` or `tail` on Unix/Linux.

The following command behaves like `tail -n 50 -f`
```
Get-Content <file> -tail 50 -wait
```