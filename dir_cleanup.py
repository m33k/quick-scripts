# Author: m33k
# Date: 2017-09-19
# Description: Create a tmp folder in downloads and delete content older than x days.
# Environment: For Windows 7

import os

tmpdir = ('C:\\Users\\$USER\\Downloads\\tmp\\')

# Create dir if missing
if not os.path.exists(tmpdir):
    os.mkdir(tmpdir)
    print("Creating tmp dir...")
else:
    print("tmp dir already exists...")

