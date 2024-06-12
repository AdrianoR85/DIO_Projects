LIMIT = 500
LIMIT_WITHDRAW = 3
AGENCY = '0001'
users = [{'name': 'Lara', 'cpf': 123456}]
accounts = [{'account_number': 101010, 'balance': 0}]
account_number = 000000
  
def filter_cpf(value, database):
  field_type = ''
  for row in database:
    if 'cpf' in row:
      field_type = 'cpf'
    else:
      field_type = 'account_number'
       
  filtered_data = [data for data in database if data[field_type] == value]
  return filtered_data[0] if filtered_data else None

def create_address():
  labels = ['public_area', 'number', 'neighborhood', 'city', 'state']
  address = []
  
  print('\n----------Client Address---------\n')
  for label in labels:
    data = input(f'Enter {label}: ').lower()
    address.append(data)
  
  return address

def create_user(users):
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

  users.append(obj_client)
 
def create_account(AGENCY, users, accounts):
  cpf = input('Enter CPF: ')
  user = filter_cpf(cpf, users)
  
  if not user:
    print('\nUser does not exists\n')
    return
  
  account_number += 1
  
  obj_account = {
    'agency': AGENCY,
    'account_number': account_number,
    'balance': 0,
    'daily_withdraw': 0,
    'cpf': cpf
  }
  
  accounts.append(obj_account)
  
def deposit_amount(amount, account_number, database=accounts):
  account = filter_cpf(account_number, database)
  
  if account:
    if amount > 0:
      account['balance'] += amount
      print(f"You have deposited ${amount:.2f} and your balance is ${account['balance']:.2f}")
    else:
      print("Operation Invalid")
  else:
    print("Account does not exists")
    
def withdraw_amount(amount, account_number, database=accounts):
  account = filter_cpf(account_number, database )
  if account:
    if amount > account['balance']:
      print("Insufficient balance")
    elif amount > LIMIT:
      print(f"You have exceeded your limit of ${LIMIT:.2f}")
    elif account['daily_withdraw'] == LIMIT_WITHDRAW:
      print(f"You have exceeded your limit of {LIMIT_WITHDRAW} withdraw")
    elif amount <= 0:
      print("Operation Invalid")
    else:
      account['balance'] -= amount
      account['daily_withdraw'] += 1
      print(f"You have withdrawn {amount:.2f} and your balance is {account['balance']:.2f}")

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
  4. New User
  5. New Account
  6. Exit  
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
#     create_user(users)
#   elif option == "5":
#     create_account(AGENCY, users, accounts)
#   elif option == "6":
#     break
#   else:
#     print("Invalid option")
#   print("-" * 24)
