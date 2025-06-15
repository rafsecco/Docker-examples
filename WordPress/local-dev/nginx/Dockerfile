FROM nginx:latest

COPY ./nginx/certs/*.pem /etc/nginx/certs/
COPY ./nginx/default.conf /etc/nginx/conf.d/

COPY ./nginx/start.sh /
RUN chmod +x /start.sh

CMD /start.sh
# CMD ["/start.sh"]
