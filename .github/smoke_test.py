"""Check that the WebAssembly game starts in a browser and reacts to the mouse."""
import base64
import sys
import time

from playwright.sync_api import sync_playwright

URL = "http://localhost:8000/pylos.html"

# The same size as the iframe on the website, see docs/play.md
WIDTH = 560
HEIGHT = 640

with sync_playwright() as p:
    browser = p.chromium.launch(channel="chrome")
    page = browser.new_page(viewport={"width": WIDTH, "height": HEIGHT})
    errors = []
    page.on("pageerror", lambda e: errors.append(str(e)))
    page.goto(URL)
    time.sleep(10)
    before = page.screenshot()
    # Only hover: hovering over a menu item highlights it.
    # Clicking could select 'Quit'
    for y in range(20, HEIGHT, 20):
        for x in range(20, WIDTH, 80):
            page.mouse.move(x, y)
            time.sleep(0.02)
    page.mouse.move(WIDTH // 2, HEIGHT // 2)
    time.sleep(1)
    after = page.screenshot()
    browser.close()

print("Screenshot:", base64.b64encode(after).decode())
if errors:
    sys.exit(f"Page errors: {errors}")
if before == after:
    sys.exit("Moving the mouse did not change the page")
