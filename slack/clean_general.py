from slack_cleaner2 import SlackCleaner
from silvestrini import *
s = SlackCleaner(TOKEN, sleep_for=1)
for msg in s.c.general.msgs(with_replies=True):
  msg.delete()