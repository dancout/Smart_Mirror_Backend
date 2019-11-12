from flask import Flask, request, Response
import requests
import os
from dotenv import load_dotenv
from datetime import datetime, timezone, timedelta
import urllib.parse


# ========================= Initial Setup =========================
# - Name this flast app
app = Flask(__name__)

# - Load in the environment variables from the .env file
load_dotenv()


# ========================= Helper Functions ================================
def formatTime(t):
    t = t.split("T")[0]
    t += "T00:00:00-05:00"  # TODO: do we need to drop this -5?
    return t


# ========================= Routes ================================
"""
This '/' route simply returns 'Hello World'. It can be used as an indication if the backend is running.
"""
@app.route('/')
def hello():
    return 'Hello World!'


"""
This POST request takes in lattidue & longitude in the body. It will then return weather related information from the
open weather API.
"""
@app.route('/weather')
def weather():
    # Grab the location from the incoming request
    latitude = request.args['latitude']
    longitude = request.args['longitude']

    # Build the open weather API request
    # pulled from the rapidAPI site
    url = "https://community-open-weather-map.p.rapidapi.com/weather"

    querystring = {
        "lat": latitude,
        "lon": longitude,
        "callback": "test",
        "units": "imperial"
    }

    headers = {
        'x-rapidapi-host': "community-open-weather-map.p.rapidapi.com",
        'x-rapidapi-key': os.getenv("open_weather_api_key")
    }

    response = requests.request(
        "GET", url, headers=headers, params=querystring)

    return response.text


"""
This route returns a user's [google] calendar events from today and the following 2 days
"""
@app.route('/calendar')
def calendar():

    # Grab the current time
    current_time = datetime.today()
    # Grab this timestamp, in 3 days
    future_time = current_time + timedelta(days=3)

    # Set the current and 3 days future timestamps to a readable format
    current_time_str = formatTime(current_time.isoformat())
    future_time_str = formatTime(future_time.isoformat())

    # Grab your primary google calendar and google api key from the .env file
    google_primary_calendar = os.getenv(
        "google_primary_calendar", "not available")
    google_api_key = os.getenv("google_api_key", "not available")

    # Set the base url
    url = f"https://www.googleapis.com/calendar/v3/calendars/{google_primary_calendar}/events?"

    # Set the necessary params for the GET request
    maxResults = 999
    orderBy = "startTime"
    singleEvents = "true"

    params = {
        "orderBy": orderBy,
        "maxResults": maxResults,
        "singleEvents": singleEvents,
        "timeMin": current_time_str,
        "timeMax": future_time_str,
        "key": google_api_key,
    }

    # Add the params to the GET Request url
    url += urllib.parse.urlencode(
        params, quote_via=urllib.parse.quote)

    response = requests.request(
        "GET", url)

    return response.text
