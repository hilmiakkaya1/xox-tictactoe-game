# Numeric Lotto Program

This code randomly selects 6 numbers from the numbers between 1 and 49, sorts them and prints them on the screen. In this way it creates a "Lotto" like random number combination. Here is how this code works:

1. `lotto_numbers = (1..49).to_a.sample(6)` creates an array of numbers between 1 and 49 (an array containing every number from 1 to 49) and then randomly selects 6 numbers from that array.

2. `lotto_numbers.sort!` line sorts the 6 selected numbers in descending order. This makes the lotto numbers appear in an ordered way.

3. `The line puts "6 random numbers selected for you:"` prints a caption on the screen telling the user which numbers have been selected.

4. `puts lotto_numbers.join(', ')` prints the 6 selected numbers separated by commas.

An example output could look like this:
```
6 random numbers chosen for you:
3, 10, 17, 34, 39, 48
```

Each time you run it, you get different random numbers because the sample(6) function selects different numbers each time.
