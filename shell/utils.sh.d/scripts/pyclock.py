#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
import datetime

def now_unix():
    return int(time.mktime(datetime.datetime.now().timetuple()))

def today_begin():
    return int(time.mktime(datetime.datetime.combine(datetime.date.today(), datetime.time()).timetuple()))

print("now:             %s" % datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
print("now unix:        %s" % now_unix())
print("today begin:     %s" % today_begin())
print("today end:       %s" % (today_begin() + (24 * 3600) * 1 - 1))
print("yesterday end:   %s" % (today_begin() - (24 * 3600) * 1 - 1))
print("tomorrow end:    %s" % (today_begin() + (24 * 3600) * 2 - 1))

