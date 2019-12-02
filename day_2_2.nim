import strutils

type
  Program = seq[int]

proc loadProgram(filename: string): Program =
  let
    input = readFile(filename)
    ints = split(input, ',')
  for i in ints:
    result.add(i.strip(chars = {'\n'}).parseInt)

proc run(program: Program, noun, verb: int): int =
  var program = program
  program[1] = noun
  program[2] = verb
  var ip = 0
  while true:
    case program[ip]
    of 1:
      let
        a = program[program[ip + 1]]
        b = program[program[ip + 2]]
        dest = program[ip + 3]
      program[dest] = a + b
    of 2: 
      let
        a = program[program[ip + 1]]
        b = program[program[ip + 2]]
        dest = program[ip + 3]
      program[dest] = a * b
    of 99: break
    else:
      quit("invalid oipode occured at " & $ip)
    inc(ip, 4)
  result = program[0]

const expect = 19690720

var program = loadProgram("input/2.txt")
for i in 1..100:
  for j in 1..100:
    let result = program.run(i, j)
    if result == expect:
      echo 100 * i + j

