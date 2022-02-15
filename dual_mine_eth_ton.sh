#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

ETHPOOL=eth.2miners.com:2020
ETHWALLET=nano_3regscwe6ffcr8imxzgbjmejahbg751jbxi71s9u7zqh5m68megjrfg1rdbx
ETHWORKER=vastai

TONPOOL=https://next.ton-pool.com
TONWALLET=EQAmUYXuv8i-0lpzYxZH-0b6j4_RhhpAMGi0V-EaNBn_oqys

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $ETHPOOL --user $ETHWALLET --dualmode TONDUAL --dualpool $TONPOOL --dualuser $TONWALLET --worker $ETHWORKER $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $ETHPOOL --user $ETHWALLET --dualmode TONDUAL --dualpool $TONPOOL --dualuser $TONWALLET --worker $ETHWORKER $@
done
    
    
