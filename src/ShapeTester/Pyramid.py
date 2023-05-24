import math
class Pyramid:
  l = 0
  h = 0

#Constructor
  def __init__(self):
    self.l = 0.0
    self.h = 0.0

# Volume Calculation
  def calcVol(self):
    vol = (float(self.l) * float(self.l) * float(self.h))/3
    return vol
    
#Surface Area Calculation
  def calcSA(self):
    sa = float(self.l)**2 + 2 * float(self.l) * (math.sqrt((float(self.l)**2)/4 + float(self.h)**2))
    return sa
    