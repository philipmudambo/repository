# Define the substitution cipher alphabets
english_alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
al_bhed_alphabet = "YPLTAVKREZGXMJQNHUODWFSICBypltavkrezgxmjqnhuodwfsicb"

# Define the encode and decode functions
def encode(message, key=1):
    encrypted_string = ""
    for i in range(len(message)):
        match_found = False
        for j in range(len(english_alphabet)):
            if message[i] == english_alphabet[j]:
                encrypted_string += al_bhed_alphabet[(j + key) % len(al_bhed_alphabet)]
                match_found = True
                break
        if not match_found:
            encrypted_string += message[i]
    return encrypted_string

def decode(message, key=1):
    decrypted_string = ""
    for i in range(len(message)):
        match_found = False
        for j in range(len(al_bhed_alphabet)):
            if message[i] == al_bhed_alphabet[j]:
                decrypted_string += english_alphabet[(j - key) % len(english_alphabet)]
                match_found = True
                break
        if not match_found:
            decrypted_string += message[i]
    return decrypted_string

# Define the main program loop
while True:
    # Display the initial prompt
    user_input = input("Enter 1 to encode, 2 to decode, or 3 to exit: ")
    # Handle the user's input
    if user_input == "1":
        message = input("Enter the message to encode: ")
        key = int(input("Enter the key value (default is 1): "))
        encoded_message = encode(message, key)
        print("Encoded message:", encoded_message)
    elif user_input == "2":
        message = input("Enter the message to decode: ")
        key = int(input("Enter the key value (default is 1): "))
        decoded_message = decode(message, key)
        print("Decoded message:", decoded_message)
    elif user_input == "3":
        break
    else:
        print("Invalid input, please try again.")
