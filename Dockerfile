FROM fluent/fluentd:v1.6-debian-1

USER root

# install curl for put log
RUN apt-get update \
    && apt-get install curl -y

# install s3 plugin
RUN gem install fluent-plugin-s3

# create log dir and set permission
RUN mkdir -p /var/log/td-agent \
    && chown fluent:fluent /var/log/td-agent

USER fluent