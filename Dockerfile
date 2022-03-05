from amazonlinux:latest
RUN yum -y install tzdata python3 aws-cli wget jq gzip tar git

RUN mkdir /opt
WORKDIR /opt
RUN git clone https://github.com/kdmukai/gdax_bot.git
WORKDIR /opt/gdax_bot
RUN pip3 install -r requirements.txt
COPY ./init.sh /opt/gdax_bot/init.sh
RUN chmod 700 /opt/gdax_bot/init.sh

CMD ["/bin/sh", "/opt/gdax_bot/init.sh"]
