from Crypto.Cipher import DES
from Crypto.Util.Padding import pad, unpad
import binascii
def encrptionDES():
    #لازم key يبقي طويل وكمان 8 bytes 
    key = b'01234567'
    # بيعمل inisilazed ل des و يكون ب mod ECB 
    des = DES.new(key, DES.MODE_ECB)
    # الرساله الي بتتشفر وكمان لازم تتحول الي byte
    message = b'Khaled Mohamed'
    # نضرب الرساله المحوله الي byte مع key الي بنستخدم ف 8 byte
    padded_message = pad(message, 8)
    encrypted_message = des.encrypt(padded_message)
    # كدا الكود نزل متحول الي byte علشان نفهم نحول كلمه 
    hex_encrypted_message = binascii.hexlify(encrypted_message).decode('utf-8')
    #حولنا كلمه الي decode علشان نفهم كلمه
    return hex_encrypted_message
def decryptDEs():
    #لازم key يبقي طويل وكمان 8 bytes 
    key = b'01234567'
    # بيعمل inisilazed ل des و يكون ب mod ECB 
    des = DES.new(key, DES.MODE_ECB)
     # الرساله الي بتتشفر وكمان لازم تتحول الي byte
    message = b'This is a secret message'
     # نضرب الرساله المحوله الي byte مع key الي بنستخدم ف 8 byte
    padded_message = pad(message, 8)
    # نعمل encrypt للكلمه 
    encrypted_message = des.encrypt(padded_message)
    # نعمل decrypt للكلمه
    decrypted_message = des.decrypt(encrypted_message)
    # نقسم الرساله المحوله الي byte مع key الي بنستخدم ف 8 byte
    unpadded_message = unpad(decrypted_message, 8)
    return unpadded_message.decode('utf-8')
