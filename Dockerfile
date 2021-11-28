FROM openjdk:12-alpine
ARG JAR_FILE

ENV HOME=/home/appuser
ENV APP_HOME=$HOME/app

RUN mkdir -p $APP_HOME

RUN addgroup -g 1001 -S appuser && adduser -u 1001 -S appuser -G appuser

RUN chown -R appuser:appuser $HOME
RUN chown -R appuser:appuser $INVOICES

USER appuser
WORKDIR $HOME

COPY ${JAR_FILE} $APP_HOME/app.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar", "app/app.jar"]
