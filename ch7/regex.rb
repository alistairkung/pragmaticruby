#Regex is a pattern that can be matched against a string.
#It allows you to match a string from a pattern, extract the sections that match all or part of a pattern and change or replace all or part of a pattern
#
#Creating Patterns:
# commonly achieved by defining pattern between / /:
/cat/ # => matches "dog and cat" and "catch"
/123/ # => matches "7478123"

#Matching strings with patterns:
# Ruby operator =~ matches a string against a pattern, returning the character offset into the string at which the match occurred:
"dog and cat" =~ /cat/ # => 8
"Cat" =~ "cat" # => nil
# Because nil is returned if no matches exist, regex can be used in conditional statements and loops:

str = "cat and dog"
if str =~ "cat"
  puts "Theres a cat here somewhere:"
end

File.foreach('testfile').with_index do |line, index|
  puts "#{index}: #{line}" if line =~ /on/
end

#Changing Strings with Patterns:
#sub method:
str = "Dog and Cat"
new_str = str.sub(/Cat/, "Gerbil")
#sub method only changes the first match it finds
#
#gsub method- changes all matches:
str = "Dog and Cat"
new_str1 = str.sub(/a/, "*") # => "Dog *nd Cat"
new_str2 = str.gsub(/a/, "*") # => "Dog *nd C*t"

#sub! and gsub! modify the original string and returns nil if no match is found.

#Regex are objects, instances of class Regexp
#They can therefore be stored to variables and passed to methods
#regexp objects can be created in the following ways:
/mm\/dd/ # => /mm\/dd/
Regexp.new("mm/dd") # => /mm\/dd/
%{mm/dd} # => /mm\dd/

#Deeper patterns:

#Anchors:
str = "this is\nthe time"
#^ - anchors match to beginning of a line /^string/
str.sub(/^this/, 'cat') # => "cat is\nthe time"
#$ - anchors match to end of a line /string$/
str.sub(/time$/, 'cat') # => "this is\nthe cat"
#\A - anchors match to beginning of a string
str.sub(/\Athis/, 'cat') # => "cat is\nthe time"
#\b - anchors matching ASCII word letters. e.g. can find is within "this is\nmine"
str.sub(/\bis/, 'cat') # => "this cat\nthe time"
#\Z - anchors match to end of a string

#Character Classes
#Matches any single character between []
str = "this is\nthe time"
str.sub(/[aeiou]/, '!') # => "th!s !s\nth! t!m!"
#Character classes allow special regex characters |()+^$? to be matched:
str.sub(/[\n]/, ' ') # => "this is the time"
#Sequences can also be defined between []
str2 = "see [The PickAxe-page 123]"
str2.sub(/[A-F]/, '!') # => "see [The Pick!xe-page 123]"
#sequence can be chained
str2.gsub(/[A-F0-9]/, '!') # => "s!! [!he !ick!xe-page !!!]"
#for multi characters:
str2.sub(/[0-9][0-9]/, '!') # => "see [The PickAxe-page !!3]"
#The folowing are some character class abbreviations:
/\d/ # => decimal digits
/\s/ # => blank space
/\w/ # => word character (a-zA-Z0-9)
/\S/ # => any character that is not white space
/\W/ # => any character that is not a word character

#Repetition
#r+- matches one or more occurrences of r
str3 = "The moon is made of cheese"
str3.sub(/\w+/, "!") # => "! moon is made of cheese"
# . represents any character except newline
# * matches zero or more occurrences of a matcher
str3.sub(/\s.*\s/, "!") # => "the!cheese"
# ? matches zero or one occurrence of a matcher
str3.sub(/\s.*?\s/, "!") # => "the !is made of cheese"
str3.sub(/o?o/, "!") # # =>  "the m!n is made of cheese"
# + matches one or more occurences of a matcher
str3.sub(/\w+/, "!") # => # => "!moon is made of cheese"

#Alternation
str4 = "red ball blue sky"
# | matches either the construct before or after it:
str4.sub(/d|e/, '!') # => "r!d ball blue sky"
str4.sub(/al|lu/, '!') # => "red b!l blue sky"
str4.sub(/red ball|angry sky/, '!') # => "! blue sky"
