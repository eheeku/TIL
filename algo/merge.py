def mergesort(A,p=0,r=None):
    if r is None : r = len(A)
    if p < r-1:
        q = int((p+r)/2)
        mergesort(A,p,q)
        mergesort(A,q,r)
        merge(A,p,q,r)

def merge(A,p,q,r):
    B,i,j = [],p,q
    while True:
        if A[i] <= A[j]:
            B.append(A[i])
            i += 1
        else:
            B.append(A[j])
            j += 1
        if i == q:
            while j < r:
                B.append(A[j])
                j += 1
            break
        if j == r:
            while i < q:
                B.append(A[i])
                i += 1
            break
        A[p:r] = B


