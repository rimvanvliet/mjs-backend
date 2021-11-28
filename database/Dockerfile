FROM postgres:latest

ENV POSTGRES_USER mjs
ENV POSTGRES_PASSWORD mjs
ENV POSTGRES_DB mjs
ENV LANG nl_NL.utf8

COPY resources/db-init docker-entrypoint-initdb.d

RUN localedef -i nl_NL -c -f UTF-8 -A /usr/share/locale/locale.alias nl_NL.UTF-8

USER postgres

EXPOSE 5432
