ARG  PYTHON_VERSION=3.9.16
FROM python:${PYTHON_VERSION}-slim-buster

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
    libexpat1 \
    libflac8 \
    libfontconfig1 \
    libfreetype6 \
    libjpeg62-turbo \
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

# 安装必要的软件包和Chrome浏览器
RUN apt-get update && apt-get install -y wget gnupg2 curl unzip
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update && apt-get install -y google-chrome-stable

# 安装Chrome驱动
RUN CHROME_DRIVER_VERSION=`curl -sS https://chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget -q https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip -d /usr/bin && \
    rm chromedriver_linux64.zip

# 设置Chrome无头模式
ENV DISPLAY=:99
RUN apt-get install -y xvfb
RUN Xvfb :99 -screen 0 1024x768x16 &

WORKDIR /app

ADD . /app

# Install pip requirements
RUN /bin/sh -c ' cd /app && python -m pip install -r /app/requirements.txt '

#CMD python main.py