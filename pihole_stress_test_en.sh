#!/bin/bash

# Prompt for the Pi-hole IP address
read -p "Enter the Pi-hole IP address: " PIHOLE_IP

# Prompt for the number of queries
read -p "Enter the number of queries to send: " QUERY_COUNT

# Prompt for the delay between queries
read -p "Enter the delay (in seconds) between each query: " DELAY

# Function to send a single DNS request
send_query() {
    local domain=$1
    dig @$PIHOLE_IP $domain +short
}

echo "Starting Pi-hole stress test"
echo "Pi-hole IP: $PIHOLE_IP"
echo "Number of Queries: $QUERY_COUNT"
echo "Delay between queries: $DELAY seconds"

# Generate and send the DNS requests
for ((i=1; i<=QUERY_COUNT; i++))
do
    # Generate a random domain name
    RANDOM_DOMAIN="test$RANDOM.com"
    
    # Send the DNS request
    send_query $RANDOM_DOMAIN
    
    # Wait for the specified delay
    sleep $DELAY
done

echo "Pi-hole stress test completed"