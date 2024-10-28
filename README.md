# Kali Linux (Docker Container on GCP)

- On GCP Console
```bash
docker build -t kalivnc .
docker run -p 5900:5900 -p 5901:5901 -p 5902:5901 -it kalivnc /bin/bash
```

- On Kali Docker Container
```bash
touch /root/.Xauthority
vncserver :1 -geometry 1280x1024 -depth 24 -display :1 -localhost no -xstartup /usr/bin/startxfce4
```

- On VNCView Machine
```bash
vncviewer <ip>
```
