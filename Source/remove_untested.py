import re
import sys

takeNext = True

for line in sys.stdin:
    if re.match(r'%\s*Untested', line):
        takeNext = False
    else:
        if takeNext:
            print(line, end='')
        else:
            takeNext = True
