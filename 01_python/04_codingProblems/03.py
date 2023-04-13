# Question:
# With a given integral number n, write a program to generate a dictionary that contains (i, i*i)
# such that is an integral number between 1 and n (both included). And then the program should
# print the dictionary.
# Suppose the following input is supplied to the program:
# 8
# Then, the output should be:
# {1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36, 7: 49, 8: 64}

# Hints:
# In case of input data being supplied to the question, it should be assumed to be a console input.
# Consider use dict()

# Solution:

number = int(input("Number: "))
output: dict = {}

for i in range(1, number + 1):
    output[i] = i * i


# or
def square_dict(number) -> dict:
    x = 1
    while x <= number:
        # output.update({x: x * x}) or
        output[x] = x * x
        x += 1
    return output


print(output)