def insertionsort(L):
    for i in range(len(L)):
        p = i
        while p > 0 and L[p]<L[p-1]:
            (L[p], L[p-1]) = (L[p-1], L[p])
            p = p-1
    return L

L = list(range(50, 1, -3))
print("<---------INSERTION SORT---------->")
print("Before sorting:", L)
print("After sorting :", insertionsort(L))