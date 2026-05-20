def simpleCipher(encrypted, k):
    decrypted = ""
    
    for char in encrypted:
        char_code = ord(char) - ord('A')
        
        new_code = (char_code - k) % 26
        
        new_char = chr(new_code + ord('A'))
        
        decrypted += new_char
        
    return decrypted

text = 'VTAOG'
shift = 2

result = simpleCipher(text, shift)
print("ข้อความที่ถอดรหัสได้คือ:", result)