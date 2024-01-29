def factorial(n):
    if n==0:
        return 1
    else:
        return (n*factorial(n-1))

def multiply(m, n):
    if n == 1:
        return m
    else:
        return (m + multiply(m, n-1))


fact = factorial(5)
print(fact)

prod = multiply(5, 2)
print(prod)