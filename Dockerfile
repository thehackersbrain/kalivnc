# -----------------------------------------------------------------------------
# Dockerfile for Kali Linux with XFCE, VNC, and custom tools
# Author: Gaurav Raj (thehackersbrain) @ Cybercraft Labs Pvt Ltd
# Created: October 2024
# License: MIT
# Description: A custom Kali Linux image with a desktop environment, VNC server,
# and additional tools configured for a streamlined experience.
# -----------------------------------------------------------------------------

FROM kalilinux/kali-rolling

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y kali-desktop-xfce kali-linux-default locales sudo wget
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y xrdp tigervnc-standalone-server && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
RUN apt install iputils-ping git golang -y
RUN apt clean -y && apt autoremove -y

RUN apt install novnc x11vnc -y
RUN touch /root/.Xauthority
RUN mkdir -p /root/.vnc /root/.config/tigervnc /root/BurpSuitePro

COPY config/vimrc /root/.vimrc
COPY config/tmux.conf /root/.tmux.conf
COPY config/passwd /root/.vnc/passwd
COPY config/burp-pro.json /root/BurpSuitePro
COPY config/burploader.jar /root/BurpSuitePro
COPY setup.sh /root/setup.sh

RUN chmod 600 /root/.vnc/passwd
RUN chmod +x /root/setup.sh
RUN cp -r /root/.vnc/* /root/.config/tigervnc/


# CMD ["vncserver", ":1", "-geometry", "1280x1024", "-depth", "24", "-display", ":1", "-localhost", "no", "-xstartup", "/usr/bin/startxfce4"]
CMD ["sh", "-c", "/root/setup.sh && vncserver :1 -geometry 1280x1024 -depth 24 -localhost no -xstartup /usr/bin/startxfce4 && tail -f /dev/null"]
