# Speculatively General
class Bottles
  NoMore = lambda do |verse|
    "No more bottles of beer on the wall, " +
    "no more bottles of beer.\n" +
    "Go to the store and buy some more, " +
    "99 bottles of beer on the wall.\n"
  end

  LastOne = lambda do |verse|
    "1 bottle of beer on the wall, " +
    "1 bottle of beer.\n" +
    "Take it down and pass it around, " +
    "no more bottles of beer on the wall.\n"
  end

  Penultimate = lambda do |verse|
    "2 bottles of beer on the wall, " +
    "2 bottles of beer.\n" +
    "Take one down and pass it around, " +
    "1 bottle of beer on the wall.\n"
  end

  Default = lambda do |verse|
    "#{verse.number} bottles of beer on the wall, " +
    "#{verse.number} bottles of beer.\n" +
    "Take one down and pass it around, " +
    "#{verse.number - 1} bottles of beer on the wall.\n"
  end

  def song
    verses(99, 0)
  end

  def verses(finish, start)
    (finish).downto(start).map {|verse_number|
      verse(verse_number) }.join("\n")
  end

  def verse(number)
    verse_for(number).text
  end

  def verse_for(number)
    case number
    when 0 then Verse.new(number, &NoMore)
    when 1 then Verse.new(number, &LastOne)
    when 2 then Verse.new(number, &Penultimate)
    else        Verse.new(number, &Default)
    end
  end
end

class Verse
  attr_reader :number
  def initialize(number, &lyrics)
    @number = number
    @lyrics = lyrics
  end

  def text
    @lyrics.call self
  end
end
# How many verse variants are there?
# There are four verse variants (they start on lines 2, 9, 16 and 23 above).

# Which verses are most alike? In what way?
# Verses 3-99 are most alike (as evidenced by the fact that all are produced by the Default variant).

# Which verses are most different? In what way?
# Verses 0, 1 and 2 are clearly different from 3-99, although it’s not obvious in what way.

# What is the rule to determine which verse should be sung next?
# Buried deep within the NoMore lambda is a hard-coded "99," which might cause one to infer that verse 99 follows verse 0.

# How difficult was it to write?
# There’s far more code here than is needed to pass the tests. This unnecessary code took time to write.

# How hard is it to understand?
# The many levels of indirection are confusing. Their existence implies necessity, but you could study this code for a long time without discerning why they are needed.

# How expensive will it be to change?
# The mere fact that indirection exists suggests that it’s important. You may feel compelled to understand its purpose before making changes.



# ******************Code explanation****************************
# The code above first defines four lambdas (lines 2, 9, 16, and 23) and saves them 
# as constants (NoMore, LastOne, Penultimate, and Default). Notice that each 
# lambda takes argument verse but only Default actually refers to it. 
# The code then defines the song and verses methods. 
# Next comes the verse method, which passes the current verse number to 
# verse_for and sends text to the result (line 40). This is the line of code 
# that returns the correct string for a verse of the song.

# Things get more interesting in verse_for, but before pondering that method, 
# look ahead to the Verse class on line 53. Verse instances are initialized 
# with two arguments, number and &lyrics, and they respond to two messages, 
# number and text. The number method simply returns the verse number that 
# was passed during initialize. The text method is more complicated; it 
# sends call to lyrics, passing self as an argument.

# If you now return to verse_for and examine lines 45-48, you can see that 
# when instances of Verse are created, the number argument is a verse 
#   number and the &lyrics argument is one of the lambdas. 
#   The verse_for method gets invoked for every verse of the song, and 
#   therefore, one hundred instances of Verse will be created, each 
#   containing a verse number and the lambda that corresponds to that number.

# To summarize, sending verse(number) to an instance of Bottles invokes 
# verse_for(number), which uses the value of number to select the correct 
# lambda on which to create and return an instance of Verse. The verse method 
# then sends text to the returned Verse, which in turn sends call to the 
# lambda, passing self as an argument. This invokes the lambda, which may 
# or may not actually use the argument that was passed.