#########################################################################
# File Name: re-run-container.sh
# Author: Yin Congmin
# mail: congmin.yin@intel.com
# Created Time: Tue 08 Nov 2022 11:18:48 AM CST
#########################################################################
#!/bin/bash
ctr task kill redis
sleep 1
ctr containers del redis
sleep 1
make GODEBUG=1
make install
systemctl restart containerd.service
sleep 1
ctr run -d docker.io/library/redis:alpine3.13 redis

