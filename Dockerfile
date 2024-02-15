FROM ubuntu:22.04

RUN apt update
RUN apt install -y nginx
RUN apt install -y git
RUN apt install cron

RUN rm -rf /var/www/html
RUN git clone https://github.com/Jaelinny/jelly-blog.git /var/www/html

COPY test.sh /var/www/html

CMD service cron start;nginx -g  'daemon off;'
