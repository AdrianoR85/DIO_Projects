def number_of_bottle(numbers):
  print(numbers)
  N, K = numbers.split()
  N = int(N)
  K = int(K)
  return (N // K) + (N % K)
  
T = int(input("Loop: "))

for i in range(T):
  numbers = input("Enter numbers: ")
  total_of_bottles = number_of_bottle(numbers)
  print(total_of_bottles)