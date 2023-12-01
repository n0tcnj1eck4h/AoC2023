sum = 0
digits = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" ]

function ermm(f, c, line)
  finds = filter(x -> !isnothing(x), f.(digits, line))
  finds = UnitRange{UInt64}.(finds)
  v = c(f->f.start, finds)
  return finds[v[2]]
end

while !eof(stdin::IO) line = readline()
  first_digit_range = ermm(findfirst, findmin, line) 
  last_digit_range  = ermm(findlast,  findmax, line)
  println(line[first_digit_range], " ", line[last_digit_range])

  idx = findfirst(isequal(line[first_digit_range]), digits)[2]
  idx = (idx-1) % 9 + 1
  global sum += idx * 10

  idx = findfirst(isequal(line[last_digit_range]), digits)[2]
  idx = (idx-1) % 9 + 1
  global sum += idx 
  
end

println(sum)
