#!/bin/bash
cd $WEBSITE_PATH

# Fetch the latest changes from the remote repository
git fetch origin main

# Check for updates
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ $LOCAL != $REMOTE ]; then
    echo "New updates found. Pulling changes and restarting the application."

    pm2 stop index

    # Discard local changes
    git reset --hard origin/main

    # Pull the latest changes
    git pull origin main

    # Install any new dependencies
    npm install

    # Restart the application using PM2
    bash $WEBSITE_PATH/restart-site.sh
else
    echo "No updates found. Application is up-to-date."
fi
