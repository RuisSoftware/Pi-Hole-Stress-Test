#!/bin/bash

# Vraag om het Pi-hole IP adres
read -p "Voer het IP-adres van de Pi-hole in: " PIHOLE_IP

# Vraag om het aantal queries
read -p "Voer het aantal te versturen queries in: " QUERY_COUNT

# Vraag om de vertraging tussen queries
read -p "Voer de vertraging in (in seconden) tussen elke query: " DELAY

# Functie om een enkel DNS verzoek te sturen
send_query() {
    local domain=$1
    dig @$PIHOLE_IP $domain +short
}

echo "Pi-hole stress test wordt gestart"
echo "Pi-hole IP: $PIHOLE_IP"
echo "Aantal queries: $QUERY_COUNT"
echo "Vertraging tussen queries: $DELAY seconden"

# Genereer en verstuur de DNS verzoeken
for ((i=1; i<=QUERY_COUNT; i++))
do
    # Genereer een willekeurige domeinnaam
    RANDOM_DOMAIN="test$RANDOM.com"
    
    # Stuur het DNS verzoek
    send_query $RANDOM_DOMAIN
    
    # Wacht voor de opgegeven vertraging
    sleep $DELAY
done

echo "Pi-hole stress test is voltooid"