Max SubSet Sum No Adjacent
https://www.algoexpert.io/questions/max-subset-sum-no-adjacent

￼

[75, 105, 120, 75, 90, 135]

75 + 120
75 + 75
75 + 90 
75 + 135

105 + 75
105 + 90
105 + 135

120 + 90
120+ 135

75 + 135

[0, 0, 75 + 120,  max(195, 75 + masSum[i-2])    ]



#
# [75, 105, 120, 75, 90, 135]
#
# 75 + 120
# 75 + 75
# 75 + 90
# 75 + 135
#
# 105 + 75
# 105 + 90
# 105 + 135
#
# 120 + 90
# 120+ 135
#
# 75 + 135
#
# [0, 0, 75 + 120,  max(195, 75 + max(75,105))), max(previous, 90 + max(previous 3 numbers))     ]
#
#
# create an array of length same as array
# maxSum[0] = 0
# maxSum[1] = 0
# maxSum[2] = array[0] + array[2]
# currentMax = max(array[0], array[1])
# for i in range(3, len(array)):
#     currentMax = max(currentMax,array[i-2])
#     maxSum[i] = max(maxSum[i-1],array[i] + currentMax)
# return maxSum[-1]

def maxSubsetSumNoAdjacent(array):
    if len(array) == 0:
        return 0
    elif len(array) == 1:
        return array[0]
    elif len(array) == 2:
        return max(array[0], array[1])
    maxSum = [float('-inf')]*len(array)
    maxSum[0] = array[0]
    maxSum[1] = max(array[0], array[1])
    for i in range(2, len(array)):
        maxSum[i] = max(maxSum[i - 1], array[i] + maxSum[i-2])
    return maxSum[-1]

print(maxSubsetSumNoAdjacent([75, 105, 120, 75, 90, 135]))


