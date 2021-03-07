# GoBGP docker

Container image based on [`GoBGP`](https://github.com/osrg/gobgp).

### How to use image:

First create GoBGP directory and place cofiguration file.
```
mkdir gobgp
vim gobgp/gobgp.conf
```

Then run container with GoBGP directory mounted as /etc/gobgp
```
docker run  -d -v `pwd`/gobgp:/etc/gobgp:rw -p 179:179 kvitex/gobgp
```