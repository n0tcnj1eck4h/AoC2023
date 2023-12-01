sum = 0
while !eof(stdin::IO)
  line = readline()
  first_digit_idx = findfirst(isdigit, line)
  last_digit_idx = findlast(isdigit, line)
  number_str = line[first_digit_idx] * line[last_digit_idx]
  global sum += parse(UInt32, number_str)
end

println(sum)
