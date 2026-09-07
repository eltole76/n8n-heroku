FROM n8nio/n8n:latest

USER root

WORKDIR /home/node/packages/cli
ENTRYPOINT []

RUN apk add --no-cache --virtual .build-deps python3 make g++ \
	&& npm install --global --loglevel=error n8n-nodes-telegram-better-markdown@1.0.0 \
	&& apk del .build-deps

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]