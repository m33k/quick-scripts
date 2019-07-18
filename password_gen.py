#!/usr/bin/env python

import string
import random
import argparse

string = string.ascii_letters + string.digits
parser = argparse.ArgumentParser()
parser.add_argument('integers', nargs='?', type=int, default=1)
number = parser.parse_args()
print(number)


passwd = random.sample(string, 10)
print("".join(passwd)) # Prints Password without array
