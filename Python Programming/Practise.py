def findUnique(t):
    t += " "
    s = list(t)
    s.sort()
    for i in range(len(s)-1):
        if s[i] == s[i+1]:
            s.remove(s[i])
            s.remove(s[i+1])
    result = "".join(s)
    print(result)
            


t = 'abbac'
findUnique(t)