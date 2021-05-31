FROM ubuntu:18.04

RUN apt-get update && apt-get install --no-install-recommends -y \
        binfmt-support \
        build-essential \
        curl \
        chromium-browser \
        dnsutils \
        git \
        gpg \
        gpg-agent \
        gpgconf \
        gpgv \
        iproute2 \
        iptables \
        lbzip2 \
        less \
        libcanberra-gtk-module \
        libcanberra-gtk3-module \
        libgconf-2-4 \
        libgtk-3-0 \
        libnss3 \
        libx11-xcb1 \
        libxss1 \
        libxtst6 \
        lsb-release \
        locales \
        net-tools \
        netcat \
        network-manager \
        openssh-client \
        pigz \
        policykit-1 \
        python \
        sshpass \
        sudo \
        usbutils \
        qemu-user-static \
    && rm -rf /var/lib/apt/lists/*

COPY sdkmanager.deb /sdkmanager.deb
RUN apt-get install -y /sdkmanager.deb

COPY configure_qemu.sh /configure_qemu.sh
