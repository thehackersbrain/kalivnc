FROM kalilinux/kali-rolling

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y kali-desktop-xfce kali-linux-default locales sudo
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y xrdp tigervnc-standalone-server && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
RUN apt install iputils-ping git golang python-pipx -y
RUN apt clean -y && apt autoremove -y

ENV PULSE_SERVER=/tmp/PulseServer
ENV WAYLAND_DISPLAY=wayland-0
ENV XDG_RUNTIME_DIR=/tmp/runtime-dir/
ENV DISPLAY=:0

RUN apt install novnc x11vnc -y
RUN touch /root/.Xauthority
COPY vimrc /root/.vimrc
COPY tmux.conf /root/.tmux.conf
