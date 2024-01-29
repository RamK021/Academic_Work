def bubblesort(L):
    for i in range(len(L)-1):
        for j in range(len(L)-i-1):
            if L[j] > L[j+1]:
                (L[j], L[j+1]) = (L[j+1], L[j])
    return L

L = list(range(50, 1, -3))
print("<---------BUBBLE SORT---------->")
print("Before Sorting:",L)
print("After Sorting :", bubblesort(L))
