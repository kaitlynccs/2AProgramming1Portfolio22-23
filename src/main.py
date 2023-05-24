#Kaitlyn Cao | Feb 6 2023 | Shape Calculator
#!/usr/bin/python3
from Box import Box
from Sphere import Sphere
from Pyramid import Pyramid

play = "yes"
shape = 0
print("Welcome to shape maker! Lets find the volume and surface area for a few shapes...  ")
b1 = Box()
s1 = Sphere()
p1 = Pyramid()

while play == "yes":
  shape = int(input("To build a box press 1 : \n To build a pyramid press 2: \n To build a sphere press 3:"))

  if shape == 1:
    b1.l = input("enter value for box length:")
    print(b1.l)
    b1.w = input("enter value for box width:")
    print(b1.w)
    b1.h = input("enter value for box height:")
    print(b1.h)
    print("Box Volume: " + str(b1.calcVol()))
    print("Box Surface Area: " + str(b1.calcSA()))
    
  if shape == 2:
    p1.l = input("enter value for pyramid length:")
    print(p1.l)
    p1.h = input("enter value for pyramid height:")
    print(p1.h)
    print("Pyramid Volume: " + str(p1.calcVol()))
    print("Pyramid Surface Area: " + str(p1.calcSA()))
    
  if shape == 3:
    s1.r = input("enter value for sphere radius:")
    print(s1.r)
    print("Sphere Volume: " + str(s1.calcVol()))
    print("Sphere Surface Area: " + str(s1.calcSA()))

  play = input("done! do you want to calculate another shape? yes/no")
  if play == "no":
    print("bye!")