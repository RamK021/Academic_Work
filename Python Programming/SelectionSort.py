def selectionsort(L):
    for i in range(len(L)):
        min = i
        for j in range(i, len(L)):
            if L[min] > L[j]:
                min = j
        (L[i], L[min]) = (L[min], L[i])
    return L

L = list(range(50, 1, -3))
print("<---------SELECTION SORT---------->")
print("Before sorting:", L)
print("After sorting :", selectionsort(L))