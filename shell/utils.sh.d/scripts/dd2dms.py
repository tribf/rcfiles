#!/usr/bin/python
# -*- coding: UTF-8 -*-

import sys

def dd2dms(dd):
    mnt,sec = divmod(dd*3600,60)
    deg,mnt = divmod(mnt,60)
    return deg, mnt, sec

def main(argv):
    if argv == None:
        print('argv[0] <dd> ...')
    else:
        for i in range(1, len(sys.argv)):
            print(dd2dms(float(argv[i])))   

if __name__ == '__main__':
    main(sys.argv)
