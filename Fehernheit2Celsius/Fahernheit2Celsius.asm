# Assume that the floating-point argument fahr is passed in $f12
# result should go in $f0.

# We assume that the compiler places the three floating 
# point constants in memory within easy reach of the 
# global pointer $gp.
f2c:
lwc1 $f16, 5($gp)       # $f16 = 5.0 (5.0 in memory)
lwc1 $f18, 9($gp)       # $f18 = 9.0 (9.0 in memory)

# They are then divided to get the fraction 5.0/9.0:
div.s $f16, $f16, $f18      # $f16 = 5.0 / 9.0

# Next, we load the constant 32.0 and then subtract 
# it from fahr ($f12):
lwc1 $f18, const32($gp) # $f18 = 32.0
sub.s $f18, $f12, $f18 # $f18 = fahr – 32.0

# Finally, we multiply the two intermediate results,
# placing the product in $f0 as the return result

mul.s $f0, $f16, $f18   # $f0 = (5/9)*(fahr –32.0)
jr $ra # return