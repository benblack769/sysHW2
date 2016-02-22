def edge_case_adj(x,AH,AL,is_high):
    hadj = 1 if is_high else -1
    if A[L] < x < A[H]:
        return L
    else if x <A[L]:
        return L-1
    else if x > A[H]:
        return H+1
    else:
        if A[L] == x:
            return  L - hadj
        if A[H] == x:
            return H - hadj

    return L if x == L or
def bsh(A,x,is_high,L,H):
    if H == L + 1 or H == L:

    mid = (H + L) // 2
    if x < A[mid]:
        return bsh(A,x,L,mid)
    elif x > A[mid]:
        return bsh(A,x,mid,H)
    else:
        return mid

def bs(A,x,is_high):
    return bsh(A,x,is_high,0,len(A)-1)

def between(A,x,y):
    if y < x:
        return 0
    ix = bs(A,x,True)
    iy = bs(A,y,False)
    print(ix,iy)
    return iy - ix

args = [1,2,3,4,5,6,7,8,9,10]
print(between(args,3.4,15.3))
