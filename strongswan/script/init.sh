#!/bin/bash -e

OUT="/mnt"
SSL="$OUT/ipsec.d/ssl"

cp -r /etc/ipsec.* $OUT
cp -r /etc/strongswan.* $OUT

sed -i "s#VPN_DOMAIN#${VPN_DOMAIN}#g" $OUT/ipsec.conf
sed -i "s#VPN_USERNAME#${VPN_USERNAME}#g" $OUT/ipsec.conf
sed -i "s#VPN_USERNAME#${VPN_USERNAME}#g" $OUT/ipsec.secrets
sed -i "s#VPN_PASSWORD#${VPN_PASSWORD}#g" $OUT/ipsec.secrets

# gen ca key and cert
ipsec pki --gen --outform pem > $OUT/ipsec.d/private/ca.pem
ipsec pki --self --in $OUT/ipsec.d/private/ca.pem --dn "C=CN, O=VPN, CN= VPN CA" --ca --lifetime 1095 --outform pem > $OUT/ipsec.d/cacerts/ca.cert.pem
# gen server key and cert
ipsec pki --gen --outform pem > $OUT/ipsec.d/private/server.pem
ipsec pki --pub --in $OUT/ipsec.d/private/server.pem | ipsec pki --issue --lifetime 1200 --cacert $OUT/ipsec.d/cacerts/ca.cert.pem \
    --cakey $OUT/ipsec.d/private/ca.pem --dn "C=CN, O=VPN, CN=${VPN_DOMAIN}" \
    --san="${VPN_DOMAIN}" --flag serverAuth --flag ikeIntermediate \
    --outform pem > $OUT/ipsec.d/certs/server.cert.pem
# gen client key and cert
ipsec pki --gen --outform pem > $OUT/ipsec.d/private/client.pem
ipsec pki --pub --in $OUT/ipsec.d/private/client.pem | ipsec pki --issue --cacert $OUT/ipsec.d/cacerts/ca.cert.pem \
    --cakey $OUT/ipsec.d/private/ca.pem --dn "C=CN, O=VPN, CN=client.${VPN_DOMAIN}" \
    --san="client.${VPN_DOMAIN}" \
    --outform pem > $OUT/ipsec.d/certs/client.cert.pem

openssl pkcs12 -export -inkey $OUT/ipsec.d/private/client.pem -in $OUT/ipsec.d/certs/client.cert.pem -name "client.${VPN_DOMAIN}"\
         -certfile $OUT/ipsec.d/cacerts/ca.cert.pem -caname "VPN CA"  -out $SSL/client.cert.p12 -passout pass:${VPN_P12_PASSWORD}

cp $OUT/ipsec.d/cacerts/ca.cert.pem $SSL/ca.cert.pem
cp $OUT/ipsec.d/certs/server.cert.pem $SSL/server.cert.pem


# gen mobileconfig
sed -i "s#%HLVPN_CLIENT_P12_PWD%#${VPN_P12_PASSWORD}#g" $SSL/vpn.mobileconfig
sed -i "s#%HLVPN_REMOTE_ID%#${VPN_DOMAIN}#g" $SSL/vpn.mobileconfig
cat $SSL/ca.cert.pem|base64 > $SSL/ca.pem
sed -i -e "/%HLVPN_CA_CERT%/r $SSL/ca.pem" -e "/%HLVPN_CA_CERT%/d" $SSL/vpn.mobileconfig
cat $SSL/server.cert.pem|base64 > $SSL/server.pem
sed -i -e "/%HLVPN_SERVER_CERT%/r $SSL/server.pem" -e "/%HLVPN_SERVER_CERT%/d" $SSL/vpn.mobileconfig
cat $SSL/client.cert.p12|base64 > $SSL/client.pem
sed -i -e "/%HLVPN_CLIENT_P12%/r $SSL/client.pem" -e "/%HLVPN_CLIENT_P12%/d" $SSL/vpn.mobileconfig
rm $SSL/*.pem
