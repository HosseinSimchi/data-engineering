import os
import time
import random
from datetime import datetime

LOG_FILE = os.environ.get("LOG_FILE", "/data/app.log")
INTERVAL = float(os.environ.get("INTERVAL", "2"))

LEVELS = ["INFO", "WARNING", "ERROR"]
WEIGHTS = [0.7, 0.2, 0.1] 

MESSAGES = {
    "INFO": [
        "User logged in",
        "User logged out",
        "Request processed successfully",
        "Cache refreshed",
        "Scheduled task completed",
    ],
    "WARNING": [
        "Disk usage is high",
        "Response time is slow",
        "Memory usage above 80%",
        "Retrying failed request",
    ],
    "ERROR": [
        "Database connection failed",
        "Unhandled exception occurred",
        "Service unavailable",
        "Timeout while calling external API",
    ],
}


def ensure_log_file():
    directory = os.path.dirname(LOG_FILE)
    if directory and not os.path.exists(directory):
        os.makedirs(directory, exist_ok=True)
    if not os.path.exists(LOG_FILE):
        open(LOG_FILE, "a").close()


def main():
    ensure_log_file()
    sequence = 0
    print(f"[producer] starting. writing to {LOG_FILE} every {INTERVAL}s", flush=True)

    while True:
        sequence += 1
        level = random.choices(LEVELS, weights=WEIGHTS, k=1)[0]
        message = random.choice(MESSAGES[level])
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        line = f"{timestamp} | {level} | #{sequence} | {message}\n"

        with open(LOG_FILE, "a") as f:
            f.write(line)
            f.flush()

        print(f"[producer] wrote: {line.strip()}", flush=True)
        time.sleep(INTERVAL)


if __name__ == "__main__":
    main()
