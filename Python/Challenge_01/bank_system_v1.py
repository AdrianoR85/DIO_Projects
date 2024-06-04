balance = 0
daily_withdraw = 0
LIMIT = 500
LIMIT_WITHDRAW = 3

while True:
  title = "Menu"
  print(title.center(20, "-"))
  print(
  """
  1. Deposit
  2. Withdraw
  3. Statement
  4. Exit  
  """)
  option = input("> ")
  print("-" * 24)
  
  # Deposit -------------------------------------------------------------
  if option == "1":
    amount = int(input("Enter amount to deposit: "))
    if amount > 0:
      balance += amount
      print(f"You have deposited ${amount:.2f} and your balance is ${balance:.2f}")
    else:
      print("Operation Invalid") 
  # Withdraw -------------------------------------------------------------
  elif option == "2":
    amount = int(input("Enter amount to withdraw: "))
    if amount > balance:
      print("Insufficient balance")
    elif amount > LIMIT:
      print(f"You have exceeded your limit of ${LIMIT:.2f}")
    elif daily_withdraw == LIMIT_WITHDRAW:
      print(f"You have exceeded your limit of {LIMIT_WITHDRAW} withdraw")
    elif amount <= 0:
      print("Operation Invalid")
    else:
      balance -= amount
      daily_withdraw += 1
      print(f"You have withdrawn {amount:.2f} and your balance is {balance:.2f}")
  # Statement -------------------------------------------------------------
  elif option == "3":
    print("-------Statement-------")
    print(f"Your balance is ${balance:.2f}")
  # Exit -------------------------------------------------------------
  elif option == "4":
    break
  # Invalid option -------------------------------------------------------------
  else:
    print("Invalid option")
  print("-" * 24)
