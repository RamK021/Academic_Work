def lcm(m, n):
    for i in range((m if m<n else n), m*n + 1):
        if i%m==0 and i%n==0:
            print(f"LCM({m},{n}):", i)
            break

def gcd(m, n):
    for i in range((m if m>n else n), 0, -1):
        if m%i==0 and n%i==0:
            print(f"GCD({m},{n}):", i)
            break

lcm(5, 4)
gcd(3, 5)