from flask import Flask, request, Response
import requests
import os
from dotenv import load_dotenv

# ========================= Initial Setup =========================
# - Name this flast app
app = Flask(__name__)

# - Load in the environment variables from the .env file
load_dotenv()

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
