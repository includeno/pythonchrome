FROM includeno/pythonchrome:3.9.16.chrome111.0.5563.41

WORKDIR /app

ADD . /app

# Install pip requirements
RUN /bin/sh -c ' cd /app && python -m pip install -r /app/requirements.txt '

CMD python main.py