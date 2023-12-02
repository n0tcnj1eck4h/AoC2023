package main

import "fmt"
import "bufio"
import "os"
import "strings"
import "strconv"


func main() {
  sum := 0
  scanner := bufio.NewScanner(os.Stdin)
  for scanner.Scan() {
    line:= scanner.Text()

    _, sets_str := func() (string, string) {
      x := strings.Split(line, ": ")
        return x[0], x[1]
    }()

    maximums := map[string]int{
        "blue":  0,
        "green": 0,
        "red":   0,
    }

    for _, set_str := range strings.Split(sets_str, "; ") {
      for _, cube := range strings.Split(set_str, ", ") {
        count, color := func() (int, string) {
            x := strings.Split(cube, " ")
            count, _ := strconv.Atoi(x[0])
            return count, x[1]
        }()

        max_, _ := maximums[color]
        if(count > max_) {
          maximums[color] = count
        }
      }
    }

    red_count, _   := maximums["red"]
    green_count, _ := maximums["green"]
    blue_count, _  := maximums["blue"]

    power := red_count * green_count * blue_count
    sum += power
  }

  fmt.Println(sum)
}
