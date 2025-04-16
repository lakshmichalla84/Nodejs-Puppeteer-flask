# Stage 1: Scraping with Puppeteer
FROM node:18-slim as scraper

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Install Chromium and dependencies
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    libatk-bridge2.0-0 \
    libnss3 \
    libxss1 \
    libasound2 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgtk-3-0 \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY scrape.js package.json ./
RUN npm install
ENV SCRAPE_URL=http://books.toscrape.com
RUN node scrape.js

# Stage 2: Python Flask server
FROM python:3.10-slim

WORKDIR /app
COPY --from=scraper /app/scraped_data.json .
COPY server.py requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
CMD ["python", "server.py"]



