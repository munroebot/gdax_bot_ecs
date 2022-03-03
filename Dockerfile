from amazonlinux:latest
RUN yum -y install tzdata python-pip aws-cli wget jq gzip tar

WORKDIR ~
RUN git clone https://github.com/kdmukai/gdax_bot.git
WORKDIR gdax_bot
RUN pip install -r requirements.txt



