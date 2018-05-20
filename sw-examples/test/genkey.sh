# we'll need to import only ca.crt
# host.crt is not signed with it, but it has the same key :)

openssl req \
    -newkey rsa:2048 \
    -x509 \
    -nodes \
    -keyout host.key \
    -new \
    -out host.crt \
    -subj /O=CustomScripts \
    -reqexts SAN \
    -extensions SAN \
    -config <(cat /etc/ssl/openssl.cnf \
        <(printf '[SAN]\nsubjectAltName=DNS:localhost')) \
    -sha256 \
    -days 3650

openssl req \
    -x509 \
    -nodes \
    -key host.key \
    -out ca.crt \
    -subj /O=CustomScripts \
    -days 3650

