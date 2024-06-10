balance = 0
daily_withdraw = 0
LIMIT = 500
LIMIT_WITHDRAW = 3
users = [{'name': 'John', 'cpf': '456123'}, {'name': 'Lara', 'cpf': '123456'}]
  
  
def filter_cpf(cpf, users):
  for user in users:
    if user['cpf'] == cpf:
      return True
  return False  

def create_address():
  labels = ['public_area', 'number', 'neighborhood', 'city', 'state']
  address = []
  
  print('\n----------Client Address---------\n')
  for label in labels:
    data = input(f'Enter {label}: ').lower()
    address.append(data)
  
  return address

def create_user():
  print('\n----------Personal data---------\n')
  cpf = input('Enter CPF: ')
  user = filter_cpf(cpf, users)
  
  if user:
    print('User already exists')
    return 
  
  obj_client =  {
    'cpf': cpf,
    'name': input('Enter name: ').lower(),
    'birthday': input('Enter birthday: ').lower(),
    'address': create_address()
  }

  
  return obj_client
 
def create_account():
  

  client = create_user()
  users.append(client)

def deposit_amount(amount):
  global balance
  if amount > 0:
    balance += amount
    print(f"You have deposited ${amount:.2f} and your balance is ${balance:.2f}")
  else:
    print("Operation Invalid")


def withdraw_amount(amount):
  global balance, daily_withdraw
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


def statement_amount():
  print("-------Statement-------")
  print(f"Your balance is ${balance:.2f}")


def menu():
  title = "Menu"
  print(title.center(20, "-"))
  print(
  """
  1. Deposit
  2. Withdraw
  3. Statement
  4. Exit  
  """)
  

# while True:
#   menu()
#   option = input("> ")
#   print("-" * 24)
#   if option == "1":
#     amount = int(input("Enter amount to deposit: "))
#     deposit_amount(amount)
#   elif option == "2":
#     amount = int(input("Enter amount to withdraw: "))
#     withdraw_amount(amount)
#   elif option == "3":
#     statement_amount()
#   elif option == "4":
#     break
#   else:
#     print("Invalid option")
#   print("-" * 24)
