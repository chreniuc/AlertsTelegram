#!/bin/bash
. $HOME/.bashrc
. $HOME/.profile
. $HOME/.env

DATE=$({ hostname; storjshare status | tee >(grep 'running' | awk {'print $(NF-1)'}) >(grep '%' | awk {'print $(NF-1)'}) >/dev/null; } | tr "\n" " ")
~/AlertsTelegram/sendtelegram.sh -m " Vps: $DATE"


