FROM python:3.8-slim-buster
RUN apt-get update -y && \
    apt-get install -y python-pip python-dev && \
    apt-get install -y libpq-dev && \
    apt-get install -y postgresql-client && \
    apt install -y openssh-client


WORKDIR /app
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

COPY ./start.sh /app/start.sh
RUN chmod +x /app/start.sh
RUN mkdir -p /root/.ssh


EXPOSE 8000
ENV PYTHONPATH='.'
