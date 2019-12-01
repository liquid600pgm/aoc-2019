import strutils
import math

var
  file = open("input/1.txt")
  ln: string
  totalFuel = 0.0

while file.readLine(ln):
  let
    mass = parseFloat(ln)
    fuel = floor(mass / 3) - 2
  totalFuel += fuel

echo totalFuel

