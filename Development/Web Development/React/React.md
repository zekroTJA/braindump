Web Page: [https://react.dev/](https://react.dev/)

Project: [https://github.com/facebook/react](https://github.com/facebook/react)

# Resources

- Quick Start: [https://react.dev/learn](https://react.dev/learn)
- API Reference: [https://react.dev/reference/react](https://react.dev/reference/react)
- Playlist by Fireship: [https://www.youtube.com/playlist?list=PL0vfts4VzfNgUUEtEjxDVfh4iocVR3qIb](https://www.youtube.com/playlist?list=PL0vfts4VzfNgUUEtEjxDVfh4iocVR3qIb)
- Great example Project: [https://github.com/traefik/faency](https://github.com/traefik/faency)

# Guides

- [Migrating a Create React App (CRA) application to Vite](https://www.darraghoriordan.com/2021/05/16/migrating-from-create-react-app-to-vite/)

# Libraries

> I’ve also started to collect starred projects on GitHub in this List, but It is not complete at all. [https://github.com/stars/zekroTJA/lists/react](https://github.com/stars/zekroTJA/lists/react)

## [styled-components](https://github.com/styled-components/styled-components)

A very great library that let’s you create components with CSS/SCSS style defined directly in the JavaScript code. This way, you can reference and react to variables in your app. Also, this allows to dynamically theme your app using the [`ThemeProvider`](https://styled-components.com/docs/advanced#theming).

For a better developer experience with Visual Studio Code, I suggest installing the [vscode-styled-components](https://marketplace.visualstudio.com/items?itemName=styled-components.vscode-styled-components) extension. It enables intellisense and code highlighting in these style tags.

### Example

```tsx
const Button = styled.button`
	border-radius: 3px;
  background-color: ${(p) => p.theme.accent};
`;
```

### Links

- Project: [https://github.com/styled-components/styled-components](https://github.com/styled-components/styled-components)
- Docs: [https://styled-components.com/docs](https://styled-components.com/docs)

## [zustand](https://github.com/pmndrs/zustand)

Absolutely dead simple React State library which is a good alternative to React Redux for small to medium sized apps.

### Example

```tsx
// Store.ts

export interface Store {
  counter: number;
  setCounter: (v: number) => void;
  increaseCounter: () => void;
}

export const useStore = create<Store>((set, get) => {
  counter: 0,
  setCounter: (counter) => set({ counter }),
  increaseCounter: () => set({ counter: get().counter + 1 }),
});

// Components.ts

export const Component: React.FC = () => {
  const [counter, increaseCounter] = useStore((s) => [
    s.counter, 
    s.increaseCounter,
  ]);

  return <button onClick={() => increaseCounter()}>
		{counter}
  </button>;
}
```

### Links

- Project: [https://github.com/pmndrs/zustand](https://github.com/pmndrs/zustand)
- Docs: [https://docs.pmnd.rs/zustand/getting-started/introduction](https://docs.pmnd.rs/zustand/getting-started/introduction)

### Example Projects

- [https://github.com/ranna-go/webapp](https://github.com/ranna-go/webapp)
- [https://github.com/zekroTJA/shinpuru/tree/master/web](https://github.com/zekroTJA/shinpuru/tree/master/web)

## [react-router](https://github.com/remix-run/react-router)

A SPA page routing library for React.

### Links

- Project: [https://github.com/remix-run/react-router](https://github.com/remix-run/react-router)
- Docs: [https://reactrouter.com/en/main/start/overview](https://reactrouter.com/en/main/start/overview)

## [react-i18next](https://github.com/i18next/react-i18next)

React wrapper for the [i18next](https://github.com/i18next/i18next) translation / i18n library.

### Links

- Project: [https://github.com/i18next/react-i18next](https://github.com/i18next/react-i18next)
- Docs: [https://react.i18next.com/](https://react.i18next.com/)

## [react-uid](https://github.com/thearnica/react-uid)

A simple solution for generating UIDs for the `key` property in React element lists.

### Example

```tsx
export const Component: React.FC = () => <div>
	{[1, 2, 3].map((v) => <p key={uid(v)}>{v}</p>)}
</div>;
```

### Links

- Project: [https://github.com/thearnica/react-uid](https://github.com/thearnica/react-uid)

## [react-sortablejs](https://github.com/SortableJS/react-sortablejs)

A react wrapper for [SortableJS](https://github.com/SortableJS/Sortable) to create drag and drop lists.

### Links

- Project: [https://github.com/SortableJS/react-sortablejs](https://github.com/SortableJS/react-sortablejs)