# -----------------------------------------------------------------------------
# Dockerfile for Kali Linux with XFCE, VNC, and custom tools
# Author: Gaurav Raj (thehackersbrain) @ Cybercraft Labs Pvt Ltd
# Created: October 2024
# License: MIT or specify another license here
# Description: A custom Kali Linux image with a desktop environment, VNC server,
# and additional tools configured for a streamlined experience.
# -----------------------------------------------------------------------------

FROM kalilinux/kali-rolling

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y kali-desktop-xfce kali-linux-default locales sudo
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y xrdp tigervnc-standalone-server && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
RUN apt install iputils-ping git golang -y
RUN apt clean -y && apt autoremove -y

RUN apt install novnc x11vnc -y
RUN touch /root/.Xauthority
COPY vimrc /root/.vimrc
COPY tmux.conf /root/.tmux.conf
RUN mkdir -p /root/.vnc
COPY passwd /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd

# CMD ["vncserver", ":1", "-geometry", "1280x1024", "-depth", "24", "-display", ":1", "-localhost", "no", "-xstartup", "/usr/bin/startxfce4"]
CMD ["sh", "-c", "vncserver :1 -geometry 1280x1024 -depth 24 -localhost no -xstartup /usr/bin/startxfce4 && tail -f /dev/null"]
