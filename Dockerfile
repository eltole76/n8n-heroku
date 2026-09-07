FROM n8nio/n8n:latest

USER root

WORKDIR /home/node/packages/cli
ENTRYPOINT []

ENV N8N_COMMUNITY_PACKAGES_ENABLED=true
ENV N8N_USER_FOLDER=/home/node/.n8n

RUN mkdir -p /home/node/.n8n/nodes \
	&& apk add --no-cache --virtual .build-deps python3 make g++ \
	&& npm install --prefix /home/node/.n8n/nodes --omit=dev --no-fund --no-audit --loglevel=error n8n-nodes-telegram-better-markdown@1.0.0 \
	&& apk del .build-deps \
	&& chown -R node:node /home/node/.n8n

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
USER node
CMD ["/entrypoint.sh"]