#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

ETHPOOL=eth.2miners.com:2020
ETHWALLET=nano_3regscwe6ffcr8imxzgbjmejahbg751jbxi71s9u7zqh5m68megjrfg1rdbx
ETHWORKER=vastai

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $ETHPOOL --user $ETHWALLET --worker $ETHWORKER $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $ETHPOOL --user $ETHWALLET --worker $ETHWORKER $@
done
    
    