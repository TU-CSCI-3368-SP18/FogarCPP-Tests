import Lexer
import Data.Maybe

--This file will test your lexer independently of everything else. Your lexer should be in a module
--Lexer. Compile this with gcc lexTest.hs
--When executed, it will print out the inputs and the corresponding lexed tokens. You will have to
--verify them by hand.

inputs = ["5",
          "52",
          "172.2",
          "7*3",
          "MR",
          "MS",
          "fogarte",
          "tau",
          "pi",
          "life",
          "ifz",
          "then",
          "else",
          "+ * / -",
          "ifz 3 then 35.23 else 10",
          "7 - 2 35.23 // tau",
          "76 - (7 * 10) % 6 MS",
          "ifz MR then 32 else life",
          "else ifz then MR MS - 0.0",
          "0.0 0 ^ 0.9 1.9 ~ 1.5 ?"
          ]

pad str n = 
    let spaces = ' ':spaces
        padding = take (n - length(str)) spaces
    in str++padding


testStr n str = 
    let resStr = show $ scanTokens str in
    do
      putStr (pad str n)
      putStrLn resStr

main = 
    let ml = (maximum (map length inputs)) + 4
        tests = map (testStr ml) inputs
    in do
      sequence tests
      return ()
