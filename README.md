# Nodejs-Puppeteer-flask
Node.js + Python Web Scraper (Multi-Stage Dockerized)

This project demonstrates a **multi-stage containerized application** that uses:

Node.js + Puppeteerfor dynamic web scraping using a headless Chromium browser.
python + Flask to host and serve the scraped content via a simple HTTP API.

Prerequisites
Before you begin, ensure you have the following installed on your system:
. Docker,nodejs, npm ,python3 ,python3-pip
 .Installed Git

  Setup Instructions

  Create a directory:
  mkdir puppeteer-flask-scraper && cd puppeteer-flask-scraper
  echo "# Nodejs-Puppeteer-flask" >> README.md
      git init
      git add README.md
      git commit -m "first commit"
      git branch -M main
      git remote add origin https://github.com/lakshmichalla84/Nodejs-Puppeteer-flask.git
      git push -u origin main
  create files scrape.js,server.py,package.json
  Run npm install 
  package-lock.json (auto-generated after `npm install`)
  create Dockerfile
  Project Structure

 ├── Dockerfile              # Multi-stage build
├── scrape.js               # Node.js scraper using Puppeteer
├── package.json            # Node.js dependencies
├── server.py               # Flask app to serve the scraped data
├── requirements.txt        # Python dependencies
└── README.md               # You're reading it!
 
 SCRAPE_URL=http://books.toscrape.com
 Build the Docker Image from Dockerfile.
 docker build -t puppeteer-flask-app .
 docker run -d -p 5000:5000 --name scraper  puppeteer-flask-app
 After finishing everything pushed to github
  git add .
 git commit -m "Initial commit"
 git branch -M main
 git remote add origin https://github.com/lakshmichalla84/Nodejs-Puppeteer-flask.git 
 git push -u origin main
 How to Access the Scraped Data
Once the container is running, open your browser and visit:
http://18.226.226.109:5000
You will receive a JSON response like:
{
  "heading": "All products",
  "title": "All products | Books to Scrape - Sandbox"
}
  


 

