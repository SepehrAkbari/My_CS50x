# TODO
h = 0
while True:
    try:
        h = int(input("Height: "))
        if 1 <= h <= 8:
            break
    except ValueError:
        print("Please enter a valid integer.")

for i in range(1, h + 1):
    print(" " * (h - i) + "#" * i + "  " + "#" * i)
