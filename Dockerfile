ARG  PYTHON_VERSION=3.9.16
FROM python:${PYTHON_VERSION}-slim

WORKDIR /tools
#debian https://packages.debian.org/bullseye/chromium
RUN apt-get update && apt-get install -y \
    wget \
    git \
    unzip \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatomic1 \
    libatspi2.0-0 \
    libbrotli1 \
    libc6 \
    libdouble-conversion3 \
    libevent-2.1-7 \
    libexpat1 \
    libflac8 \
    libfontconfig1 \
    libfreetype6 \
    libgcc-s1 \
    libjpeg62-turbo \
    libjsoncpp24 \
    liblcms2-2 \
    libminizip1 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libcairo2 \
    #    libgtk-4-1 \
    libnspr4 \
    libnss3 \
    libopenjp2-7  \
    libopus0  \
    libpng16-16 \
    libpulse0 \
    libre2-9 \
    libsnappy1v5 \
    libstdc++6 \
    libwebp6 \
    libwebpdemux2 \
    libwebpmux3 \
    libwoff1  \
    libx11-6 \
    libxcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxkbcommon0 \
    libxml2 \
    libxnvctrl0 \
    libxrandr2 \
    libxslt1.1 \
    libxtst6 \
    zlib1g \
    libwayland-client0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxkbcommon0 \
    libxrandr2 \
    xdg-utils \
    libu2f-udev \
    libvulkan1 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libpango-1.0-0 \
    libxshmfence1

#下载安装chrome: https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# https://pkgs.org/download/google-chrome-stable 指定版本
#参考:https://blog.csdn.net/weixin_42170439/article/details/100927676
#RUN /bin/sh -c 'cd /tools && chmod 755 /tools && wget -P /tools https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo apt install ./google-chrome-stable_current_amd64.deb && rm -rf google-chrome-stable_current_amd64.deb'
RUN /bin/sh -c 'cd /tools && chmod 755 /tools && wget -P /tools https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_110.0.5481.177-1_amd64.deb && dpkg -i google-chrome-stable_110.0.5481.177-1_amd64.deb && rm -rf google-chrome-stable_110.0.5481.177-1_amd64.deb'

#下载安装chrome驱动: 位置/tools
#http://chromedriver.storage.googleapis.com/index.html
ARG CHROME_DRIVER_VERSION=110.0.5481.30
RUN /bin/sh -c 'cd /tools && chmod 755 /tools &&wget http://npm.taobao.org/mirrors/chromedriver/${CHROME_DRIVER_VERSION}/chromedriver_linux64.zip &&unzip -d /tools chromedriver_linux64.zip && rm -rf /tools/chromedriver_linux64.zip && cp chromedriver /usr/local/bin/chromedriver && chmod 777 /usr/local/bin/chromedriver && /usr/local/bin/chromedriver --version'

