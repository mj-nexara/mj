# mj.py — MJ CLI Tool
import click
import datetime
import os

MJ_BANNER = """
========================================
MJ Software | প্রযুক্তির নয়, সাধনার।
MJ হচ্ছে একান্ত যাত্রার প্রতীক।
========================================
"""

DATA_DIR = "data"
LOG_FILE = os.path.join(DATA_DIR, "log.md")
PHILO_FILE = os.path.join(DATA_DIR, "philosophy.md")

@click.group()
def mj():
    """MJ CLI: Portable Knowledge Capsule"""
    print(MJ_BANNER)

@mj.command()
def log():
    """Write a personal log entry"""
    entry = input("📝 আপনার ভাবনা লিখুন: ")
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M")
    os.makedirs(DATA_DIR, exist_ok=True)
    with open(LOG_FILE, "a", encoding="utf-8") as f:
        f.write(f"- [{timestamp}] {entry}\n")
    print("✅ log.md ফাইলে সংরক্ষিত হয়েছে।")

@mj.command()
def philosophy():
    """Display the MJ philosophy"""
    if os.path.exists(PHILO_FILE):
        with open(PHILO_FILE, "r", encoding="utf-8") as f:
            print(f.read())
    else:
        print("📖 MJ দর্শন এখনো লেখা হয়নি।")

@mj.command()
def update():
    """Simulate an update check from GitHub"""
    print("🔎 MJ সফটওয়্যার আপডেট চেক হচ্ছে...")
    print("🟢 MJ already up to date.")

if __name__ == "__main__":
    mj()
