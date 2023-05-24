import math
class Sphere:

#Constructor
  def __init__(self):
    self.r = 0

# Volume Calculation
  def calcVol(self):
    vol = 4/3*(math.pi*float(self.r)**3)
    return vol

#Surface Area Calculation
  def calcSA(self):
    sa = 4 * math.pi * float(self.r)**2
    return sa
    