# pythonchrome
Base docker image for Selenium projects

# DockerHub

https://hub.docker.com/r/includeno/pythonchrome

debian linux chrome

https://packages.debian.org/bullseye/amd64/chromium/download


file:

http://ftp.jp.debian.org/debian/pool/main/c/chromium/chromium_108.0.5359.94-1~deb11u1_amd64.deb

# Generate requirements.txt
pip install pipreqs
pipreqs .

# 错误

## (The process started from chrome location /usr/bin/google-chrome is no longer running, so ChromeDriver is assuming that Chrome has crashed.)

解决方法



```
selenium.common.exceptions.WebDriverException: Message: unknown error: Chrome failed to start: exited abnormally.
(unknown error: DevToolsActivePort file doesn't exist)
(The process started from chrome location /usr/bin/google-chrome is no longer running, so ChromeDriver is assuming that Chrome has crashed.)
```

