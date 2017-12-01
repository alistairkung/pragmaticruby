#Assignment sets the variable on the left sife(lvalue) to refer to the value on the right (rvalue)
#It returns that rvalue as the result of the Assignment
#This is what allows for chain assignments:

a = b = 1 + 2 + 3

#Parallel assignment

a = 1
b = 2

#same as:

a, b = 1, 2

#Splats

##Any rvalues preceded by * is expanded before assignment to lvalues
a, b, c, d, e = *(1..5) #=> a = 1, b = 2, c = 3, d = 4, e = 5

##One lvalue can be a splat which acts like an array absorbing as many values as possible:

a, *b = 1, 2, 3 #=> a = 1, b = [2, 3]
a, *b, c = 1, 2, 3, 4 #=> a = 1, b = [2, 3], c = 4
a, *b, c, d = 1, 2, 3 #=> a= 1, b = [], c = 2, d = 3
###Raw Asterisk allows some rvalues to be ignored:
a, *, b = 1, 2, 3, 4, 5, 6 #=> a = 1, b = 6

#Nested assignments
##Extracts corresponding rvalues assigning to the parenthesized terms before assigning the higher level:

a, (b, c), d = 1, 2, 3, 4 #=> a = 1, b = 2, c = nil, d = 3
a, (b, c), d = 1, [2, 3, 4], 5 #=> a = 1, b = 2, c = 3, d = 5
a, (b, *c), d = 1, [2, 3, 4], 5 #=> a = 1, b = 2, c = [3, 4], d = 5
