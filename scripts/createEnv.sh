#!/bin/bash
echo "Adding an .env file to your project to store your personal credentials."

. ~/Smart_Mirror_Backend/scripts/env_addition.sh "open_weather_api_key"
. ~/Smart_Mirror_Backend/scripts/env_addition.sh "google_primary_calendar"
. ~/Smart_Mirror_Backend/scripts/env_addition.sh "google_api_key"

