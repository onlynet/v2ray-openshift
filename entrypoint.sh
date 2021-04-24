#!/bin/bash

sed -i "s/CLIENT_ID/$CLIENT_ID/g" v2/config.json
# sed -i "s/CLIENT_ALTERID/$CLIENT_ALTERID/g" v2/config.json
sed -i "s/CLIENT_SECURITY/$CLIENT_SECURITY/g" v2/config.json

cd v2
./v2ray -config=config.json &
nginx -g 'daemon off;'
