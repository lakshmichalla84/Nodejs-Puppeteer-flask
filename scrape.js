const puppeteer = require('puppeteer-core');
const fs = require('fs');

const SCRAPE_URL = process.env.SCRAPE_URL || 'http://books.toscrape.com';

(async () => {
  const browser = await puppeteer.launch({
    headless: 'new',
    executablePath: '/usr/bin/chromium', // Path to Chromium in the Docker container
    args: ['--no-sandbox', '--disable-setuid-sandbox'],
  });

  const page = await browser.newPage();
  await page.goto(SCRAPE_URL, { waitUntil: 'domcontentloaded' });

  // Extract data from the page
  const data = await page.evaluate(() => {
    return {
      title: document.title,
      heading: document.querySelector('h1')?.innerText || ''
    };
  });

  // Close the browser after scraping
  await browser.close();

  // Save the scraped data to a JSON file
  fs.writeFileSync('scraped_data.json', JSON.stringify(data, null, 2));
  console.log('Scraping complete! Data saved to scraped_data.json');
})();
