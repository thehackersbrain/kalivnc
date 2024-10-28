# Kali Linux (Docker Container on GCP)

- On GCP Console
```bash
docker build -t kalivnc .
docker run --network host -it kalivnc /bin/bash
```

- On Kali Docker Container
```bash
vncserver :1 -geometry 1280x1024 -depth 24 -display :1 -localhost no -xstartup /usr/bin/startxfce4
```

- On VNCView Machine
```bash
vncviewer <ip>:1
```
> :1 is for 5901 and display :1
