FROM python:3.6

RUN apt-get update -y && \
    # apt-get install -y python-pip python-dev && \
    apt-get install -y --no-install-recommends && \
    apt-get install -y libatlas-base-dev gfortran nginx supervisor

RUN pip install uwsgi

RUN useradd --no-create-home nginx
RUN rm /etc/nginx/sites-enabled/default
RUN rm -r /root/.cache

COPY ./app /code

COPY requirements.txt /code/

WORKDIR /code

RUN pip install -r requirements.txt

# ENTRYPOINT [ "python" ] // Local 

# CMD [ "app.py" ] // Local 

COPY nginx.conf /etc/nginx/
COPY meu-site-nginx.conf /etc/nginx/conf.d/
COPY uwsgi.ini /etc/uwsgi/
COPY supervisord.conf /etc/

CMD ["/usr/bin/supervisord"]
