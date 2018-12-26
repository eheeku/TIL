def factorial1(n):
    if n == 0 :
        return 1
    else:
        return n * factorial1(n-1)

def recursive0(n):
    if n == 0 :
        return 1
    else:
        # reference loop0.py
        loop3(n)
        return n*n*recursive0(n-1)

def recursive1(n):
    if n == 0 :
        return 1
    else:
        loop3(n)
        return n*recursive1(n-1)*recursive1(n-1)

def recursive2(n):
    if n == 0:
        return 1
    else:
        a = factorial1(n)
        return a*recursive2(n/2)*recursive2(n/2)

