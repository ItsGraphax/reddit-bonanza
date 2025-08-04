from datetime import datetime, timedelta

time = datetime.now()

letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'

pw = 'b' # input('Your Password: ')

def brute_force(attempt):
    if attempt == pw:
        return attempt

    if len(attempt) >= 10:
        return False

    for letter in letters:
        if brute_force(attempt + letter):
            return attempt
        
print(brute_force(''))

print(datetime.now() - time)
