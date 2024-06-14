# Types

There are three types of Dependency Injection:

- Type 1 IoC (Constructor Injection)
- Type 2 IoC (Setter Injection)
- Type 3 IoC (Interface Injection)

## Constructor Injection

[As Martin Fowler describes constructor injection](https://martinfowler.com/articles/injection.html), there is mostly a sort of assembler or container system involved where you can register implementations used for specific interfaces and where dependencies and dependents are defined.

Then, the actual dependency is passed into a constructor of a class using an interface defining the dependencies behavior.

![[DI_Martin_Fowler.png]]
[Source: Martin Fowler](https://martinfowler.com/articles/injection/injector.gif)

```
class MovieLister...

  public MovieLister(MovieFinder finder) {
      this.finder = finder;       
  }

class ColonMovieFinder...

  public ColonMovieFinder(String filename) {
      this.filename = filename;
  }

private MutablePicoContainer configureContainer() {
    MutablePicoContainer pico = new DefaultPicoContainer();
    Parameter[] finderParams =  {new ConstantParameter("movies1.txt")};
    pico.registerComponentImplementation(MovieFinder.class, ColonMovieFinder.class, finderParams);
    pico.registerComponentImplementation(MovieLister.class);
    return pico;
}
```

## Setter Injection

```go
type MovieFinder struct {
	lister MovieLister
}

func (t *MovieFinder) SetLister(lister MovieLister) {
	t.lister = lister
}
```

## Interface Injection

Almost the same as setter injection, but the injector method is specified by an interface.

```go
public interface ServiceSetter {
    void setService(Service service);
}

public class Client implements ServiceSetter {
    private Service service;

    @Override
    public void setService(Service service) {
        if (service == null) {
            throw new IllegalArgumentException("service must not be null");
        }
        this.service = service;
    }
}

public class ServiceInjector {
	private final Set<ServiceSetter> clients = new HashSet<>();

	public void inject(ServiceSetter client) {
		this.clients.add(client);
		client.setService(new ExampleService());
	}

	public void switch() {
		for (Client client : this.clients) {
			client.setService(new AnotherExampleService());
		}
	}
}

public class ExampleService implements Service {}

public class AnotherExampleService implements Service {}
```

# Resources

## Articles

- [https://martinfowler.com/articles/injection.html](https://martinfowler.com/articles/injection.html)
- [https://en.wikipedia.org/wiki/Dependency_injection](https://en.wikipedia.org/wiki/Dependency_injection)

## Videos

- [https://youtu.be/J1f5b4vcxCQ](https://youtu.be/J1f5b4vcxCQ)
- [https://youtu.be/yunF2PgJlHU](https://youtu.be/yunF2PgJlHU)