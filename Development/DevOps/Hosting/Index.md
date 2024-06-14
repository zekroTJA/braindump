General resources, applications and tools around self-hosting servers and infrastructure.

# Applications

## [traefik Proxy](https://github.com/traefik/traefik)

A “cloud native” HTTP/S and TCP proxy server perfectly suited for being used with Docker.

### Links

- Project: [https://github.com/traefik/traefik](https://github.com/traefik/traefik)
- Docs: [https://doc.traefik.io/traefik/](https://doc.traefik.io/traefik/)

## [Portainer](https://github.com/portainer/portainer)

A Web Application deployable as a Docker container to manage other Docker Containers easily via a Web UI.

### Links

- Project: [https://github.com/portainer/portainer](https://github.com/portainer/portainer)
- Docs: [https://docs.portainer.io/](https://docs.portainer.io/)

# Cloud Platforms

> Specifically Cloud Platforms that I also personally use or have used in the past.

## [Contabo](https://contabo.com/de)

They offer quite cheap VPS and bucket storage, but their servers are running on somewhat old hardware. But personally, I had never much problems with the performance of their SSD VPS as long as you don’t spin up a lot of game servers on an instance.

## [Hetzner](https://www.hetzner.com/)

They are on the more costly edge but they offer very good performing VPS, Storage Solutions and Root Servers. With their [Server Auction](https://www.hetzner.com/sb), you can even get some really strong root servers for very cheap. Also, they have a great [API](https://docs.hetzner.cloud/) and [CLI](https://github.com/hetznercloud/cli) tools available.

Another great thing is that you pay for VPS on an hourly basis. So you can practically spin up an instance just for some quick testing and delete it shortly afterwards without paying a lot for it. Also VPS are very quick up and running.

## [Vercel](https://vercel.com)

Vercel is primarily a Serverless Cloud provider for Next.JS and Node.JS applications, but you can even host serverless functions in compiled languages like Go (using their [Go SDK](https://vercel.com/docs/concepts/functions/serverless-functions/runtimes/go)) or Rust (using the Community [Rust SDK](https://github.com/vercel-community/rust)).

Serverless of course has some disadvantages compared to root servers or VPS, but generally Vercel offers a really generous free tier. So small applications suitable for serverless can be hosted basically for free there. You can also schedule jobs using [Cron Tasks](https://vercel.com/docs/cron-jobs), but in the free tier, you can only use a minimum interval of 24 hours.

## Others

### Docker

- [Railway](https://railway.app/)
- [Render](https://render.com/)
- [Fly](fly.io)

### Databases

- [Railway](https://railway.app/)
- [Planetscale](https://planetscale.com/)
- [Supabase](https://supabase.com/)