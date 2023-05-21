def encrypt(plain_text, shift):
    cipher_text = ""
    for i in range(len(plain_text)):
        # يشيل كل حروف alphapet 
        if not plain_text[i].isalpha():
            cipher_text+= plain_text[i]
            continue
        # لو حروف الي داخله small
        if (plain_text[i].islower()):
            # بيطرح  ال plantext من a ويجمع عليه ال key ويحولوا ascii ويجمع عليه a 
            cipher_text+= chr((ord(plain_text[i])-ord('a')+shift)%26 + ord('a'))
        else:
            # بيطرح  ال plantext من A ويجمع عليه ال key ويحولوا ascii ويجمع عليه A
            cipher_text+= chr((ord(plain_text[i])-ord('A')+shift)%26 + ord('A'))
    return cipher_text

def decrypt(cipher_text, shift):
    plain_text = ""
    for i in range(len(cipher_text)):
        if not cipher_text[i].isalpha():
            plain_text+= cipher_text[i]
            continue
        if cipher_text[i].islower():
            ch = ord(cipher_text[i])-ord('a')-shift
            while ch<0:
                ch+=26
            ch = ord('a')+ch
        else:
            ch = ord(cipher_text[i])-ord('A')-shift
            while ch<0:
                ch+=26
            ch = ord('A')+ch
        plain_text+= chr(ch)
    return plain_text

