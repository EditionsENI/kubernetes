FROM python:3.11

MAINTAINER Yannig Perré "yannig.perre@gmail.com"

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT ["flask"]

CMD ["run", "--host=0.0.0.0"]
