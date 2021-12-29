# conding: utf-8

import argparse
import random
parser = argparse.ArgumentParser()

parser.add_argument('--shuffle', '-s', action='store_true', default=False)  
args = parser.parse_args()


#extract mp3 files from current folder
from glob import glob
files = glob('../video')

if args.shuffle:
  random.shuffle(files)


#play each file in omxplayer:
import os
for f in files:
  try:
    os.system('omxplayer -o local --orientation 180 "%s"' % f)
  except KeyboardInterrupt:
    #exit on ctrl+c (does not work, as ctrl+c is captured by omxplayer...)
    exit()