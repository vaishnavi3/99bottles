# Incomprehensibly Concise
class Bottles
  def song
    verses(99, 0)
  end
  def verses(hi, lo)
    hi.downto(lo).map {|n| verse(n) }.join("\n")
  end

  def verse(n)
    "#{n == 0 ? 'No more' : n} bottle#{'s' if n != 1}" +
    " of beer on the wall, " +
    "#{n == 0 ? 'no more' : n} bottle#{'s' if n != 1} of beer.\n" +
    "#{n > 0  ? "Take #{n > 1 ? 'one' : 'it'} down and pass it around"
            : "Go to the store and buy some more"}, " +
    "#{n-1 < 0 ? 99 : n-1 == 0 ? 'no more' : n-1} bottle#{'s' if n-1 != 1}"+
    " of beer on the wall.\n"
  end
end
# How many verse variants are there?

# Which verses are most alike? In what way?

# Which verses are most different, and in what way?

# What is the rule to determine which verse comes next?

# How difficult was it to write?

# How hard is it to understand?

# How expensive will it be to change?
# ans----------------------

# These questions reflect core concepts of the problem,
# yet none of their answers are apparent in this solution.
# The number of variants, the difference between the variants,
# and the algorithm for looping are distressingly obscure.
# This code does not reflect its domain, and therefore 
# you can infer that it was difficult to write and will be a challenge to
# change. If you had to characterize the goal of the writer of Listing 1.1: Incomprehensibly Concise, you might suggest that their highest priority was brevity.
# Brevity may be the soul of wit, but it quickly becomes tedious in code.