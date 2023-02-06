FROM ubuntu:18.04 

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 \
  && apt-get update -y \
  && apt-get -y install vim sudo build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch \
  python3.5 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full \
  msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler \
  g++-multilib antlr3 gperf wget libncurses5:i386 libelf1:i386 lib32z1 lib32stdc++6 gtk-doc-tools intltool binutils-dev cmake lzma \
  liblzma-dev lzma-dev uuid-dev liblzo2-dev xsltproc dos2unix libstdc++5 docbook-xsl-* sharutils autogen shtool gengetopt libltdl-dev libtool-bin \
  linux-generic bc net-tools cron e2fsprogs curl psmisc bison bsdtar diffutils sed file flex groff-base libjpeg-dev zlib1g-dev\
  zsh  libexpat1-dev libslang2 libxml-parser-perl make perl openssl pkg-config tar zlib1g libltdl7-dev lib32z1-dev libjson-c-dev \
  && rm -rf /var/lib/apt/lists/* \
  && ln -sf /usr/share/zoneinfo/Pacific/Auckland /etc/localtime \
  && echo "Pacific/Auckland" > /etc/timezone



WORKDIR /home/dev_space

RUN ln -s bash /bin/sh.bash && \
  mv /bin/sh.bash /bin/sh

RUN echo "root:docker" | chpasswd
RUN useradd -m docker && echo "docker:docker" | chpasswd && usermod -aG sudo docker
USER docker:docker

RUN git config --global user.email "liqili2005@gmail.com" \
  && git config --global user.name "Kunkka Li" 

CMD [ "bash" ]



