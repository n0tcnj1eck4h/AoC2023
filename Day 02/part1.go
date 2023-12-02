package main

import "fmt"
import "bufio"
import "os"
import "strings"
import "strconv"


func main() {
  sum := 0
  maximums := map[string]int{
      "blue":  14,
      "green": 13,
      "red":   12,
  }

  scanner := bufio.NewScanner(os.Stdin)
  for scanner.Scan() {
    line:= scanner.Text()

    game_str, sets_str := func() (string, string) {
      x := strings.Split(line, ": ")
        return x[0], x[1]
    }()

    game_id, _ := strconv.Atoi(strings.Split(game_str, " ")[1])
    possible := true

    for _, set_str := range strings.Split(sets_str, "; ") {
      for _, cube := range strings.Split(set_str, ", ") {
        count, color := func() (int, string) {
            x := strings.Split(cube, " ")
            count, _ := strconv.Atoi(x[0])
            return count, x[1]
        }()

        max_, _ := maximums[color]
        if(count > max_) {
          possible = false
          break
        }
      }
    }

    if(possible) {
      sum += game_id
    }
  }

  fmt.Println(sum)
}
