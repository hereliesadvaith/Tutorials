# Question 34
# Define a function which can print a dictionary where the keys are numbers between 1 and 20 (both included)
# and the values are square of keys.

# Hints:

# Use dict[key]=value pattern to put entry into a dictionary.
# Use ** operator to get power of a number.
# Use range() for loops.

# Solution:


def printDict():
    d: dict = {}
    for i in range(1, 21):
        d[i] = i**2
    print(d)
    # for (k, v) in d.items():
    # print(k, v)


printDict()
