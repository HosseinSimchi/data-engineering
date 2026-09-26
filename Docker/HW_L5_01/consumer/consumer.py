import os
import time

LOG_FILE = os.environ.get("LOG_FILE", "/data/app.log")
ALERT_FILE = os.environ.get("ALERT_FILE", "/data/alerts.log")
POLL_INTERVAL = float(os.environ.get("POLL_INTERVAL", "1"))

ALERT_LEVELS = {"WARNING", "ERROR"}


def wait_for_log_file():
    print(f"[consumer] waiting for {LOG_FILE} to be created...", flush=True)
    while not os.path.exists(LOG_FILE):
        time.sleep(POLL_INTERVAL)
    print(f"[consumer] found {LOG_FILE}, start monitoring", flush=True)


def ensure_alert_dir():
    directory = os.path.dirname(ALERT_FILE)
    if directory and not os.path.exists(directory):
        os.makedirs(directory, exist_ok=True)


def parse_level(line):
    parts = line.split("|")
    if len(parts) >= 2:
        return parts[1].strip()
    return None


def main():
    wait_for_log_file()
    ensure_alert_dir()

    with open(LOG_FILE, "r") as f:
        f.seek(0, os.SEEK_END)
        last_position = f.tell()

    while True:
        with open(LOG_FILE, "r") as f:
            f.seek(last_position)
            new_lines = f.readlines()
            last_position = f.tell()  

        for line in new_lines:
            line = line.rstrip("\n")
            if not line:
                continue

            print(f"[consumer] {line}", flush=True)

            level = parse_level(line)
            if level in ALERT_LEVELS:
                with open(ALERT_FILE, "a") as af:
                    af.write(line + "\n")
                    af.flush()

        time.sleep(POLL_INTERVAL)


if __name__ == "__main__":
    main()
