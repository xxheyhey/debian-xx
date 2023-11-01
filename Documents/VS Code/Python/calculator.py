from math import pi, sqrt
from time import sleep

class Shape:
    def __init__(self, side1, side2):
        self.side1 = side1
        self.side2 = side2
    
    def get_area(self):
        return self.side1 * self.side2
    
    def __str__(self):
        return f'The area of this {self.__class__.__name__} is: {self.get_area()}'
    
class Rectangle(Shape):
    pass

class Square(Shape):
    def __init__(self, side):
        super().__init__(side,side)

class Triangle(Rectangle):
    
    def get_area(self):
        area = super().get_area()
        return area/2
    
class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius
    
    def get_area(self):
        return pi * (self.radius ** 2)

class Hexagon(Square):
    def get_area(self):
        return (3 * sqrt(3) * self.side1 ** 2) / 2

class Run:
    def __init__(self):
        pass

    def run(self):
        print("""
        Of which shape do you want to calculate the area?
        1. Rectangle
        2. Square
        3. Triangle
        4. Circle
        5. Hexagon
        """)

        i = float(input("Enter your answer: " ))

        if i == 1:
            x = float(input("Enter length of side 1: " ))
            y = float(input("Enter length of side 2: " ))
            rct = Rectangle(x, y)
            print(rct)
        
        elif i == 2:
            x = float(input("Enter length of the sides: " ))
            sqr = Square(x)
            print(sqr)
        
        elif i == 3:
            x = float(input("Enter length of the base: " ))
            y = float(input("Enter length of the height: " ))
            tri = Triangle(x, y)
            print(tri)
        
        elif i == 4:
            x = float(input("Enter the length of the radius: " ))
            cir = Circle(x)
            print(cir)
        
        elif i == 5:
            x = float(input("Enter the length of the sides: " ))
            hex = Hexagon(x)
            print(hex)
        
        else:
            print("Please enter a number between 1 and 5. Exiting now.")
            sleep(1)
            exit()
        
Run().run()