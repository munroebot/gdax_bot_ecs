from amazonlinux:latest
RUN yum -y install tzdata python3 aws-cli wget jq gzip tar git

WORKDIR ~
RUN git clone https://github.com/kdmukai/gdax_bot.git
WORKDIR gdax_bot
RUN pip3 install -r requirements.txt



