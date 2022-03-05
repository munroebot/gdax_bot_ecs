#!/bin/bash

# init.sh

# Fetch bot configuration from parameter store
x=$(aws ssm get-parameter --with-decryption --name gdax_bot_settings_conf);
echo -e $x > /opt/gdax_bot/settings.conf

# Fetch task runner script from paramter store
j=$(aws ssm get-parameter --name gdaxbot_trades_$INTERVAL.sh);
echo -e $j > /opt/gdax_bot/trades_${INTERVAL}.sh;
chmod +x /opt/gdax_bot/trades_${INTERVAL}.sh;

# Run task
./trades_${INTERVAL}.sh;
