import math

# Define the function to compute the sum of squares
def sum_of_squares(x):
    return (95.94285714 - x) ** 2

# Define the list of numbers
numbers = [79, 80, 82, 83, 86, 85, 86, 86, 88, 87, 89, 89, 90, 92, 94, 92, 94, 96, 95, 95, 95, 96, 98, 98, 98, 101, 103, 106, 108, 109, 112, 113, 118, 116, 119]

# Loop through the list of numbers and add up the sum of squares
sum_squares = 0
for x in numbers:
    sum_squares += sum_of_squares(x)

# Print the result
print("The sum of squares is:", sum_squares)
print(math.sqrt((sum_squares/34))/(math.sqrt(35)))
