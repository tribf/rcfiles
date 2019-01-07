#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import sys

def tohex(val, nbits):
    return hex((val + (1 << nbits)) % (1 << nbits))

print tohex(int(sys.argv[1]), int(sys.argv[2]))
