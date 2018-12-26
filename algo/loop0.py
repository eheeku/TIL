def loop0(n):
    for i in range(0,n):
        print (i)

# runtime lim i = 0 ~ i <n

def loop1(n):
    # n^2
    for i in range(0,n*n):
        print (i)

def loop2(n):
    for i in range(0,n):
        for j in range(0,n):
            print (i,j)

# receive effect
def loop3(n):
    for i in range(0,n):
        for j in range(0,i):
            print (i,j)

def loop4(n):
    for i in range(0,n):
        for j in range(0,i*i):
            print (i,j)
