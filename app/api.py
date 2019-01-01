from flask import Flask
from flask_pymongo import PyMongo
from flask_restful import Api

app = Flask(__name__)
app.config["MONGO_URI"] = "mongodb://mongodb:27017/bazarmaracanau"

mongo = PyMongo(app)

api = Api(app)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

