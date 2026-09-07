FROM n8nio/n8n:latest

USER root

WORKDIR /home/node/packages/cli
ENTRYPOINT []

RUN cd /usr/local/lib/node_modules/n8n && npm install n8n-nodes-telegram-better-markdown@1.0.0

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
USER node
CMD ["/entrypoint.sh"]