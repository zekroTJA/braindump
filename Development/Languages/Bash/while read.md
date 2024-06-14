`while read` can be used to read a line-by-line output from stdIn.

Here is a useful example iterating over the output of `find` using `while read`.

```bash
# This iterates over all directories in the current directory.
find ./ -maxdepth 1 -mindepth 1 -type d | while read dir
do
	echo "dir: $dir"
  ls -1 | wc -l
done
```