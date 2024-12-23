# Kali Linux (Docker Container on GCP)

![Banner Image](https://raw.githubusercontent.com/thehackersbrain/kalivnc/refs/heads/main/screenshots/kalivnc.png)

- Using `Dockerfile`
```bash
git clone https://github.com/thehackersbrain/kalivnc.git && cd kalivnc
docker build -t kalivnc .
docker run --network host -d kalivnc
```

- Using `docker-compose`
```bash
git clone https://github.com/thehackersbrain/kalivnc.git && mkdir kali-home && cd kalivnc
docker-compose up -d
```

- For stopping the docker image
```bash
docker ps # for getting all running containers
docker stop <image-id> # for stopping the image
# or
docker kill <image-id> # for graceful killing image
```

- On VNCView Machine
```bash
vncviewer <ip>:1
```
> `:1` is for 5901 and display `:1` and the default password is `kalikali`
