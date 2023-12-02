sum = 0
digits = [ 
  "1" "2" "3" "4" "5" "6" "7" "8" "9" 
  "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" 
]

function ermm(f, c, line)
  finds = filter(x -> !isnothing(x), f.(digits, line))
  finds = UnitRange{UInt64}.(finds)
  v = c(f->f.start, finds)
  return finds[v[2]]
end

while !eof(stdin::IO) 
  line = readline()
  first_digit = line[ermm(findfirst, findmin, line)] 
  last_digit  = line[ermm(findlast,  findmax, line)]
  global sum += findfirst(isequal(first_digit), digits)[2] * 10
  global sum += findfirst(isequal(last_digit),  digits)[2]
end

println(sum)
