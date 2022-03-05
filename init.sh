#!/bin/bash

# init.sh

# Fetch bot configuration from parameter store
x=$(aws ssm get-parameter --region us-west-2 --with-decryption --output text --query Parameter.Value --name gdax_bot_settings_conf);
echo -e $x > /opt/gdax_bot/settings.conf

# Fetch task runner script from paramter store
j=$(aws ssm get-parameter  --region us-west-2 --output text --query Parameter.Value --name gdaxbot_trades_$INTERVAL.sh);
echo -e $j > /opt/gdax_bot/trades_${INTERVAL}.sh;
chmod +x /opt/gdax_bot/trades_${INTERVAL}.sh;

# Run task
./trades_${INTERVAL}.sh;
