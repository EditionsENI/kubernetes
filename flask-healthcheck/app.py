#!/usr/bin/python3

from flask import Flask
from healthcheck import HealthCheck, EnvironmentDump

app = Flask(__name__)

# wrap the flask app and give a heathcheck url
health = HealthCheck(app, "/healthcheck")
envdump = EnvironmentDump(app, "/environment")

@app.route('/')
def hello_world():
  kube_logo = "https://upload.wikimedia.org/wikipedia/commons" + \
              "/thumb/6/67/" + \
              "Kubernetes_logo.svg/798px-Kubernetes_logo.svg.png"
  return f"<img src='{kube_logo}'/><br/><br/>Accéder au " + \
          "<a href='/healthcheck'>Healthcheck</a> " + \
          "et aux infos de l'<a href='/environment'>" + \
          "environnement</a>"
