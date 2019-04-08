#!/usr/bin/python3

from flask import Flask
from healthcheck import HealthCheck, EnvironmentDump

app = Flask(__name__)

# wrap the flask app and give a heathcheck url
health = HealthCheck(app, "/healthcheck")
envdump = EnvironmentDump(app, "/environment")

# add your own data to the environment dump
def application_data():
    return dict(maintainer="Yannig Perré")

@app.route('/')
def hello_world():
    return "Accéder au <a href='/healthcheck'>Healthcheck</a> " + \
           "et aux infos de l'<a href='/environment'>environnement</a>"

envdump.add_section("application", application_data)
