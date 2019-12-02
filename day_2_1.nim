import strutils

let
  input = readFile("input/2.txt")
  ints = split(input, ',')
var program: seq[int]

for i in ints:
  program.add(i.strip(chars = {'\n'}).parseInt)
program[1] = 12
program[2] = 2

var pc = 0
while true:
  echo (pc, program[pc])
  case program[pc]
  of 1:
    let
      a = program[program[pc + 1]]
      b = program[program[pc + 2]]
      dest = program[pc + 3]
    program[dest] = a + b
    echo (a, b, dest)
  of 2: 
    let
      a = program[program[pc + 1]]
      b = program[program[pc + 2]]
      dest = program[pc + 3]
    program[dest] = a * b
    echo (a, b, dest)
  of 99: break
  else:
    quit("invalid opcode occured at " & $pc)
  inc(pc, 4)

echo program[0]

