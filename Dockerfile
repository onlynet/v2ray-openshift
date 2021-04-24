from nginx:latest

ENV CLIENT_ID 00000000-0000-0000-0000-000000000000
ENV CLIENT_ALTERID 64
ENV CLIENT_SECURITY aes-128-gcm

# ADD conf/nginx.conf /etc/nginx/
# ADD conf/v2ray.conf /etc/nginx/conf.d/
# ADD v2ray /usr/local/bin/
# ADD entrypoint.sh /etc/

# RUN chmod -R 777 /var/log/nginx /var/cache/nginx /var/run \
	# && chgrp -R 0 /etc/nginx \
	# && chmod -R g+rwx /etc/nginx

RUN mkdir v2 \
	&& mkdir v2/log \
	&& mv v2ray v2 \
	&& mv v2ctl v2 \
	&& chmod -R 777 v2

ADD conf/config.json v2/
ADD conf/v2ray.conf /opt/app-root/etc/nginx.default.d/

RUN chmod 777 entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["entrypoint.sh"]
