# Kali Linux (Docker Container on GCP)

- On GCP Console
```bash
git clone https://github.com/thehackersbrain/kalivnc.git && cd kalivnc
docker build -t kalivnc .
docker run --network host -d kalivnc
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
