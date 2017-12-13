#Strings are sequences of characters. Can hold printable characters but also binary data.
#Basic creation of string:
'this is a string literal'
#escape sequences using \. Each \ is replaced with the corresponding binary value.
'escape using "\\"'
# => escape using "\"
'That\'s right' 
# => That's right

#Double quotes allow for more substitutions and escape sequences e.g. \n, the newline character
"double quotes also allow for string interpolation: sum of 2 and 3 is #{2 + 3}"

#%q, %Q, %
%q/this is a string literal in ''/
%Q!this is a string literal in ""!
%(the Q is actually not necessary to create a "")

#The character after q/Q represents the delimiter. If it is [{( it will look for the corresponding character to stop the string. Otherwise it will stop at the next indentical character.

#here document
string = <<END_OF_STRING
The body of the string is the input lines up to one starting with the same text that followed the '<<'
END_OF_STRING
