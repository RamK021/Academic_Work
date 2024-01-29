def quicksort(L, l, r):
    if r-l <= 1:
        return ()
    
    yellow = l+1
    for green in range(yellow, len(L)):
        if L[green] < L[l]:
            (L[yellow], L[green]) = (L[green], L[yellow])
            yellow = yellow + 1
    print(L)
    (L[l], L[yellow-1]) = (L[yellow-1], L[l])
    quicksort(L, l, yellow-1)
    quicksort(L, yellow, r)

print("<---------QUICK SORT---------->")
L = [24, 3, 6, 12, 4]
print("Before sorting:", L)
quicksort(L, 0, len(L))
print("After sorting :", L)
