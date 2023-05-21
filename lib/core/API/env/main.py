
from fastapi import FastAPI ,Form
from Crypto.Cipher import DES
from Crypto.Util.Padding import pad, unpad
import binascii
from caser_chipher import encrypt,decrypt
from vigenere_chipher import encryptveginer,decryptveginer
from transposition import encrypttranspotion,decrypttransposition 
from des import encrptionDES,decryptDEs
from pydantic import BaseModel

app = FastAPI()



class Send(BaseModel):
    text:str

@app.post('/sebehenc')
async def send_data(text:Send):
    te = encrypt(text.text, 80)
    return{"EncryptData":te}
@app.post('/sebehdec')
async def send_data(text:Send):
    te = decrypt(text.text, 80)
    return{"DecryptData":te}
@app.post('/encryptveginer')
async def send_data(text:Send):
    te = encryptveginer(text.text, "VEX")
    return{"EncryptData":te}
@app.post('/decryptveginer')
async def send_data(text:Send):
    te = decryptveginer(text.text, "VEX")
    return{"DecryptData":te}
@app.post('/encryptTransPosition')
async def send_data(text:Send):
    te = encrypttranspotion(text.text, "0123")
    return{"EncryptData":te}
@app.post('/decrptionTransPosition')
async def send_data(text:Send):
    te = decrypttransposition(text.text, "0123")
    return{"DecryptData":te}

@app.get("/encryptDES")
def read_root():
    te = encrptionDES()
    return{"EncryptData":te}
@app.get("/decryptDES")
def read_root():
    te = decryptDEs()
    return{"DecryptData":te}


