def square(x):
    return x**2

def iseven(x):
    return x%2==0
    
#print([square(i) for i in range(0,100) if iseven(i)]) 

pythagorean = [(x,y,z)  for x in range(20)
                            for y in range(x, 20)
                                for z in range(y, 20)  
                                    if x*x + y*y == z*z]
#print(pythagorean)

# matrix initialization MATRIX(4x3)

matx = [[0 for i in range(3)] for j in range(4)]
print(matx)