def find_minimum(A):
    minimum = a[0]
    for element in A:
        if element < minimum:
            minimum = element

    return minimum
