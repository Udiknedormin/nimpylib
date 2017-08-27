import math
test "Modulo operations":
  check 6 % 2 == 0
  check 7 % 2 == 1
  check -5 % 3 == 2
  var a = 3.5
  var b = 0.67
  check round(a % b, 2) == 0.15
  check -5 % -3 == -2
  check 12 % 7 == 5
  const results = @[
    "0: %4 %3 %2", "1:", "2: %2", "3: %3", "4: %4 %2",
    "5:", "6: %3 %2", "7:", "8: %4 %2", "9: %3"
  ]
  checkpoint "Evenly divisible numbers from 0 to 9"
  var compare = newSeq[string]()
  for i in range(0, 10):
    var line = $i & ":"

    if (i % 4) == 0:
        line &= " %4"

    if (i % 3) == 0:
        line &= " %3"

    if (i % 2) == 0:
        line &= " %2"
    compare.add(line)
  check results == compare
  checkpoint "Even and odd operations with module"
  const checkdata = @[
    (-3, false, true), (-2, true, false), (-1, false, true),
    (0, true, false), (1, false, true), (2, true, false)
  ]
  var data = newSeq[tuple[a: int, b, c: bool]]()
  proc even(number: int): bool = 
    ## Even numbers have no remainder when divided by 2.
    return (number % 2) == 0

  proc odd(number: int): bool =
    ## Odd numbers have 1 or -1 remainder when divided by 2.
    return (number % 2) != 0

  for value in range(-3, 3):
      data.add((value, even(value), odd(value)))
  check checkdata == data
  
