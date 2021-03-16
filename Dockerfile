FROM fluent/fluentd:v1.9.1-1.0

# Use root account to use apk
USER root

# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish
RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev shadow \
 && sudo gem install fluent-plugin-s3 --no-document \
 && sudo gem sources --clear-all \
 && usermod -u 101 fluent \
 && groupmod -g 101 fluent \
 && apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

user fluent
