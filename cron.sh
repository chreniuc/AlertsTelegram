#!/bin/bash
. $HOME/.bashrc
. $HOME/.profile
. $HOME/.env

DATE=$({ hostname; storjshare status | tee >(grep 'running' | awk {'print $(NF-3)'}) >(grep '%' | awk {'print $(NF-2)'}) >/dev/null; } | tr "\n" " ")
~/AlertsTelegram/sendtelegram.sh -m " Vps: $DATE"
# You can change here the path /path/to/AlertsTelegram/sendtelegram.sh -m " Vps: $DATE"

