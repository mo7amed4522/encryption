import math
def generate_table(plain_text,key):
    col_len = len(key)
    row_len = math.ceil(len(plain_text)/col_len)
    table = []
    i = 0
    for r in range(row_len):
        row = []
        for c in range(col_len):
            if i<len(plain_text):
                row.append(plain_text[i])
                i+=1
            else:
                row.append('')
        table.append(row)
    return table

def encrypttranspotion(plain_text,key):
    table = generate_table(plain_text,key)
    cipher_text = ""
    k = 0
    while k<len(key):
        for row in table:
            cipher_text+=row[int(key[k])]
        k+=1
    return cipher_text
def De_table(cipher,key):
    col_len = len(key)
    row_len = math.ceil(len(cipher)/len(key))
    table = []
    for r in range(row_len):
        table.append([])
        for c in range(col_len):
            table[r].append('')

    empty_cells = (col_len*row_len) - len(cipher)
    index_empty_cells = len(key) - empty_cells
    i = 0
    for c in range(col_len):
        for x in range(len(key)):
            if int(key[x])==c:
                break

        for r in range(row_len):
            if r==(row_len-1) and x>=index_empty_cells:
                continue
            table[r][x] = cipher[i]
            i+=1
    return table
def decrypttransposition(cipher,key):
    table = De_table(cipher,key)
    plain_text = ""
    for row in table:
        plain_text+= ''.join(row)
    return plain_text