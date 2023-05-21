def encryptveginer(plain_text, key):
    cipher_text = ""
    i_key = 0
    for i in range(len(plain_text)): #
        cipher_text+= chr(((ord(plain_text[i])+ord(key[i_key])-2*ord('A'))%26)+ord('A')) 
        i_key = (i_key+1)%len(key)
    return cipher_text
def decryptveginer(cipher_text, key):
    plain_text = ""
    i_key = 0
    for i in range(len(cipher_text)):
        plain_text+= chr(((ord(cipher_text[i])-ord(key[i_key])-2*ord('A'))%26)+ord('A')) 
        i_key = (i_key+1)%len(key)
    return plain_text
""" 
def decrypt2(cipher_text, key):
    plain_text = ""
    i_key = 0
    for i in range(len(cipher_text)):
        ch = (ord(cipher_text[i])-ord(key[i_key])-2*ord('A'))
        if ch>=26:
            ch%=26
        while ch<0:
            ch+=26
        ch = ord('A')+ch
        plain_text+= chr(ch)
        i_key = (i_key+1)%len(key)
    return plain_text """