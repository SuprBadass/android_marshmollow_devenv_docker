FROM openjdk:7
RUN apt-get update && apt-get install -y \
  build-essential \
  libc6-dev-i386 \
  bison \
  gnupg \
  flex \
  gperf \
  zip \
  curl \
  zlib1g-dev \
  gcc-multilib \
  g++-multilib \
  libc6-dev-i386 \
  lib32ncurses5-dev \
  x11proto-core-dev \
  libx11-dev \
  lib32z-dev \
  libgl1-mesa-dev \
  libxml2-utils \
  libssl-dev \
  xsltproc \
  unzip \
  gawk \
  bc \
  rsync \
  less \
  openssh-client \
  openssh-server \
  vim \
  libcurl4-openssl-dev \
  libexpat1-dev \
  gettext \
  && wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip \
  && unzip platform-tools-latest-linux.zip && cd ./platform-tools && cp adb fastboot /usr/bin/ && chmod +x /root/bin/adb && rm -r ./platform-tools-latest-linux* \
  && git clone https://github.com/git/git.git && cd git && git checkout v2.26.2 && make && make install && cp git /usr/bin && rm -r ./git \
  && rm -rf /var/lib/apt/lists/* \
  && cd /tmp \
  && wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz \
  && tar -xvf Python-3.6.3.tgz \
  && cd Python-3.6.3 \
  && ./configure --enable-optimizations --prefix /usr \
  && make -j8 && make install && rm -r ./Python-3.6.3 \
  && /usr/bin/python3 -m pip install --upgrade pip \
  && /usr/bin/python3 -m pip install -U pylint matplotlib numpy pexpect pillowfight pyserial scipy==1.1.0 \
  && curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo \
  && chmod a+x /bin/repo

