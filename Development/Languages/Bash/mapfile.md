To build an array from stdout lines, you can use the [[bash]] builtin `mapfile`.

```bash
mapfile -t foo < <(echo -e "a\nb\nc")

for v in "${foo[@]}"; do
  echo "$v"
done
```

---

Also see [[Process Substitution]]