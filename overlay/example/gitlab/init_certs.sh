#!/bin/bash

set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

DOMAIN="$1"
SSL_DIR="ssl"
CERT_FILE="${SSL_DIR}/${DOMAIN}.crt"
KEY_FILE="${SSL_DIR}/${DOMAIN}.key"

mkdir -p "$SSL_DIR"

openssl req \
    -x509 \
    -newkey rsa:4096 \
    -sha256 \
    -nodes \
    -days 365 \
    -keyout "$KEY_FILE" \
    -out "$CERT_FILE" \
    -subj "/CN=${DOMAIN}" \
    -addext "subjectAltName=DNS:${DOMAIN}"

chmod 600 "$KEY_FILE"
chmod 644 "$CERT_FILE"

echo "Certificate : $CERT_FILE"
echo "Private key: $KEY_FILE"
