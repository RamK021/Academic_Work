def WordToNumber(input):
    num = {'zero':'0', 'one':'1', 'two':'2', 'three':'3', 'four':'4',
           'five':'5', 'six':'6', 'seven':'7', 'eight':'8', 'nine':'9'}
    
    arr = input.split()
    result = ""
    for i in range(len(arr)):
        if arr[i] == 'double':
            result += num[arr[i+1]]
            result += num[arr[i+1]]
        elif arr[i] == 'triple':
            result += num[arr[i+1]]
            result += num[arr[i+1]]
            result += num[arr[i+1]]
        else:
            if arr[i-1] == 'double' or arr[i-1] == 'triple':
                continue
            result += num[arr[i]]
    print(result)

input1 = "two three triple four six six seven eight two"
input2 = "three four double five double five double zero one zero"
print(input1)
WordToNumber(input1)
print(input2)
WordToNumber(input2)