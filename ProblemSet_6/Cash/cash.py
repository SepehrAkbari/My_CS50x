# TODO
from cs50 import get_float

while True:
    c = get_float("Change owed: ")
    if c > 0:
        break

y = round(c * 100)

x = 0
while y > 0:
    if y >= 25:
        y -= 25
    elif y >= 10:
        y -= 10
    elif y >= 5:
        y -= 5
    else:
        y -= 1
    x += 1

print(x)
