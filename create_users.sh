#!/bin/bash

# Apply any database upgrades (only needed once)
superset db upgrade

# Check if the admin user already exists
if ! superset fab list-users | grep -q "admin"; then
    echo "Admin user not found. Creating admin user..."
    superset fab create-admin \
        --username admin \
        --firstname Admin \
        --lastname User \
        --email admin@example.com \
        --password cqy4At
else
    echo "Admin user already exists. Skipping creation."
fi

