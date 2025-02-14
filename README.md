# node-updater
Auto download and rerun node website from github

I use this script on my server to selfhost my NodeJS website that automatically updates when I push to GitHub

## Update Github
This script ensures that the local repo is a mirror of the Github one:

It navigates to the project directory, fetches the latest changes from the remote Git repository, and checks whether the local version is outdated. If updates are found, it stops the running application, discards local changes, pulls the latest updates, installs any new dependencies, and restarts the application using a separate script. If no updates are available, it prints a message indicating that the application is up to date.

## Restart Site

This script handles the setup and restart process of the application:

It first deletes the existing PM2 process named “index” to ensure a clean start. Then, it navigates to a specific subdirectory within the project, installs necessary dependencies using npm install, and builds the application using npm run build. Finally, it starts the application in development mode using PM2 with the command npm run dev -- --host, assigns it the name “index,” and saves the process state so that PM2 can automatically restart it if needed.
