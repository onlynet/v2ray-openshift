#!/bin/bash

sed -i "s/CLIENT_ID/$CLIENT_ID/g" conf/config.json
sed -i "s/CLIENT_ALTERID/$CLIENT_ALTERID/g" conf/config.json
sed -i "s/CLIENT_SECURITY/$CLIENT_SECURITY/g" conf/config.json
v2ray -config=conf/config.json &
nginx -g 'daemon off;'
