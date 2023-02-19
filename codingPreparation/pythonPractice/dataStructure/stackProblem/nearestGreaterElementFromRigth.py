def nearestGreaterElementFromRigth(arr,n):
    stack = []
    output = [0]*n
    stack.append(0)
    for i in range(n - 1, -1, -1):
        while  stack and stack[-1] <= arr[i]:
            stack.pop()
        if stack:
            output[i] = stack[-1]
        else:
            output[i] = -1
        stack.append(arr[i])
    return output
arr = [1,3,2,4]
print(nearestGreaterElementFromRigth(arr,len(arr)))