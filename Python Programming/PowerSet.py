def powerSet(L):
    ds = []
    for i in range(2**len(L)):
        ps = []
        for j in range(len(L)):
            if i & (1<<j):
                ps.append(L[j])
        ds.append(ps)
    print(ds)

L=[1,2,3]
powerSet(L)