def binary_serch(A,element):
    a,b = 0, len(A)-1
    while b >= a:
        x = int((a+b)/2)
        if A[x] <element:
            a = x+1
        elif A[x] > element:
            b = x-1
        else:
            return x
    return None

# T(n) = T(n/2)- o(1) == O(log(n))



