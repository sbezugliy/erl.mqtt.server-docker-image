FROM erlang:25.0.3-alpine as erlang_rebar_base

ENV REBAR3_BIN=rebar3
ENV REBAR3_SRC_URL=https://s3.amazonaws.com/rebar3/rebar3

ENV TEMP_DIR=/root/temp


RUN apk update && apk add git bash wget openssl 

RUN mkdir -p $TEMP_DIR

WORKDIR $TEMP_DIR

RUN wget $REBAR3_SRC_URL && chmod +x rebar3 && ./rebar3 local install
RUN export PATH=~/.cache/rebar3/bin:$PATH


FROM erlang_rebar_base as erl.mqtt.server

ENV APP_DIR=/opt/erl.mqtt.server
ENV APP_SRC_URL=https://github.com/alekras/erl.mqtt.server.git

WORKDIR $APP_DIR

RUN git clone $APP_SRC_URL .

RUN $REBAR3_BIN do version,compile 

COPY ./endpoint /sbin/endpoint
RUN chmod +x /sbin/endpoint

CMD /sbin/endpoint