from slack_cleaner2 import SlackCleaner
from silvestrini import *
s = SlackCleaner(TOKEN, sleep_for=1)

for channel in s.conversations:
  for msg in channel.msgs(with_replies=True):
    msg.delete()