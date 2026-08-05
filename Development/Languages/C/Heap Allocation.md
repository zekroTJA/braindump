[`malloc`](https://en.cppreference.com/w/c/memory/malloc) allocates memory on the heap of given size without initializing it. On success, returns the pointer to the allocated memory and `NULL` if allocation failed. 
```c
int *buffer = (int *)malloc(size * sizeof(int));
```

[`calloc`](https://en.cppreference.com/w/c/memory/calloc) allocates memory on the heap of given number of objects of given size and initializes the allocated storage to zero.
```c
int *buffer = (int *)calloc(size, sizeof(int));
```

[`realloc`](https://en.cppreference.com/w/c/memory/realloc.html) reallocates the given area of previously allocated memory with the new size. The newly allocated memory is not zeroed though. If the given pointer is zero, nothing will be done and a zero pointer is returned.
```c
int *buffer = (int *)malloc(size * sizeof(int));
buffer = (int *)realloc(buffer, new_size * sizeof(int));
```

[`free`](https://en.cppreference.com/w/c/memory/free.html) deallocates previously allocated heap memory.
```c
int *buffer = (int *)malloc(size * sizeof(int));
free(buffer);
```