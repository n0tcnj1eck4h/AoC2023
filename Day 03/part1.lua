previous_line = nil
current_line = nil
next_line = nil
lines = io.lines()
next_line = lines()
sum = 0
i = 1

function is_symbol(s)
    return s ~= "." and tonumber(s) == nil
end

function check_surrounding_symbols() 
  return (previous_line ~= nil and (
    (i < #previous_line and is_symbol(previous_line:sub(i+1,i+1))) or
    (i > 1 and is_symbol(previous_line:sub(i-1,i-1))) or
    is_symbol(previous_line:sub(i,i))
  )) or
  (next_line ~= nil and (
    (i < #next_line and is_symbol(next_line:sub(i+1,i+1))) or
    (i > 1 and is_symbol(next_line:sub(i-1,i-1))) or
    is_symbol(next_line:sub(i,i))
  )) or
  ((i < #current_line and is_symbol(current_line:sub(i+1,i+1))) or
   (i > 1 and is_symbol(current_line:sub(i-1,i-1)))) 
end

while next_line ~= nil do
  previous_line = current_line
  current_line = next_line
  next_line = lines()

  -- why am I like this
  has_symbol = false
  buffer = nil
  while i <= #current_line do
    digit = tonumber(current_line:sub(i,i))
    if digit ~= nil then
      has_symbol = has_symbol or check_surrounding_symbols()
      if buffer ~= nil then
        buffer = buffer * 10 + digit
      else
        buffer = digit
      end
    end
    if digit == nil or i == #current_line then
      if buffer ~= nil then
        if has_symbol then
          sum = sum + buffer
        end
        buffer = nil
        has_symbol = false
      end
    end
    i = i + 1
  end
  i = 1
end

print(sum)
