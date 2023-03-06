# Using Docker Image

cd example/simple_selenium
docker build . -t simple_selenium_image

pip install selenium==4.1.0

docker cp example/simple_selenium:/app