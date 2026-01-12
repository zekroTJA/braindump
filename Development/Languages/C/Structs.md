A struct definition in C can be written and used in multiple ways.

```c
struct rect {
	int width;
	int height;	
};

void f() {
	struct rect my_erct = { 1, 2 };
	my_rec.width = 10;
	my_rec.height = 20;
}
```

This does not make `rect` a usable **type** though, it only creates a **struct tag** which can be only used to be initialized with the `struct` keyword.

To use a struct as a type, it needs to be combined with a `typedef`.

```c
typedef struct rect {
	int width;
	int height;	
} rect;

int area(rect r) {
	return r.width * r.height;
}
```

