import strutils
import math

var
  file = open("input/1.txt")
  ln: string
  totalFuel = 0.0

while file.readLine(ln):
  let mass = parseFloat(ln)
  var fuel = mass
  while fuel > 0:
    fuel = max(0.0, floor(fuel / 3) - 2)
    totalFuel += fuel

echo totalFuel

