col = 1
row = 1
row_width = nil

numbers = {}
gears = {}

for line in io.lines() do
  if row_width == nil then row_width = #line end
  buffer = nil
  ndigits = 0
  col = 1
  for c in line:gmatch"." do
    digit = tonumber(c)
    if digit ~= nil then
      if buffer == nil then buffer = 0 end
      buffer = buffer * 10 + digit
      ndigits = ndigits + 1
    end

    if buffer ~= nil and (digit == nil or col == row_width) then
      numbers[#numbers + 1] = {val = buffer, row = row, col = col - ndigits, len = ndigits}
      buffer = nil
      ndigits = 0
    end

    if c == "*" then 
      gears[#gears + 1] = {col=col, row=row}
    end

    col = col + 1
  end
  row = row + 1
end

sum = 0
for i=1,#gears do
  gear = gears[i]
  product = 1
  nnumbers = 0
  print(gear.col .. " " .. gear.row)
  for j=1,#numbers do
    number = numbers[j]
    if math.abs(gear.row - number.row) <= 1 and
       gear.col >= number.col - 1 and
       gear.col - number.col <= number.len  then
      print(number.val)
      product = product * number.val
      nnumbers = nnumbers + 1
    end
  end
  print()
  if nnumbers == 2 then sum = sum + product end
end
print(sum)

