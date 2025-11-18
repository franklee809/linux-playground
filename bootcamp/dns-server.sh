#!/usr/bin/env bash

DOMAIN="google.com" # The domain you want to test
PUBLIC_DNS="8.8.8.8"
DEFAULT_DNS=$(grep nameserver /etc/resolv.conf | head -n 1 | awk '{print $2}')

echo "--- Testing DNS Resolution Time for $DOMAIN ---"
echo ""

# 1. Test the Default DNS Server
echo "Testing Default DNS ($DEFAULT_DNS)..."
# The '+stats' option prints the query time in milliseconds
dig $DOMAIN @$DEFAULT_DNS +stats | grep "Query time"

# 2. Test the Google Public DNS Server
echo ""
echo "Testing Google Public DNS ($PUBLIC_DNS)..."
dig $DOMAIN @$PUBLIC_DNS +stats | grep "Query time"