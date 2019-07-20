#!/usr/bin/env python

import string
import random
import argparse

string = string.ascii_letters + string.digits
parser = argparse.ArgumentParser(description='A basic password generator')
parser.add_argument('integers', nargs='?', type=int, default=10, help='Add an integer such as 17 to set the length of the password. If none is given, the default will be used')
number = parser.parse_args()
print(number)
print(vars(number))

# https://stackoverflow.com/questions/16878315/what-is-the-right-way-to-treat-python-argparse-namespace-as-a-dictionary

inputs = vars(number)

passwd = random.sample(string, inputs['integers'])
print("".join(passwd)) # Prints Password without array


