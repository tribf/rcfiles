#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#

function openssl_gen() {
    PRI_KEY=private_key.pem
    CERTIFICATE=certificate.pem

    echo ""
    echo "generating $PRI_KEY and $CERTIFICATE in current directory"
    echo ""
    openssl req -x509 -nodes -days 100000 -newkey rsa:8912 -keyout $PRI_KEY -out $CERTIFICATE
}

function openssl_enc() {
    FILE=$1
    CERTIFICATE=$2

    if [[ ! -e "$FILE" || ! -e "$CERTIFICATE" ]]; then
        echo ""
        echo "$0 <file> <cert>"
        echo ""
    else
        openssl smime -encrypt -binary -aes-256-cbc -in ${FILE} -out ${FILE}.enc -outform DER ${CERTIFICATE}
    fi
}

function openssl_dec() {
    FILE=$1
    PRI_KEY=$2
    if [[ ! -e "$FILE" || ! -e "$PRI_KEY" ]]; then
        echo ""
        echo "$0 <file> <pri_key>"
        echo ""
    else
        OUT=${FILE%.enc}
        openssl smime -decrypt -binary -in ${FILE} -inform DER -out ${OUT}.dec -inkey ${PRI_KEY}
    fi
}
