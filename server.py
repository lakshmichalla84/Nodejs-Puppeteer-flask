from flask import Flask, jsonify
import json
import os
import logging

app = Flask(__name__)

# Path to the scraped JSON file
DATA_FILE = "scraped_data.json"

@app.route("/")
def serve_data():
    app.logger.info(f"Checking for data file at: {DATA_FILE}")
    
    if os.path.exists(DATA_FILE):
        app.logger.info(f"Found data file, reading it...")
        with open(DATA_FILE, "r") as f:
            data = json.load(f)
        return jsonify(data)
    else:
        app.logger.error(f"Data file {DATA_FILE} not found")
        return jsonify({"error": f"{DATA_FILE} not found"}), 404

if __name__ == "__main__":
    # Make sure the Flask app is reachable from outside the container
    app.run(host="0.0.0.0", port=5000)
