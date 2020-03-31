FROM python:3.8
LABEL maintainer="Nicolas Mussat <nicolas@prose.com>"

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    postgresql-client \
    && apt-get clean

VOLUME /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python"]
