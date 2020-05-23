import binascii
import os
from Crypto.Cipher import AES
from Crypto.Util import Counter


def int_of_string(s):
    return int(binascii.hexlify(s), 16)
def encrypt_message(key, plaintext):
    iv = os.urandom(16)
    ctr = Counter.new(128, initial_value=int_of_string(iv))
    aes = AES.new(key, AES.MODE_CTR, counter=ctr)
    return iv + aes.encrypt(plaintext)
def decrypt_message(key, ciphertext):
    iv = ciphertext[:16]
    ctr = Counter.new(128, initial_value=int_of_string(iv))
    aes = AES.new(key, AES.MODE_CTR, counter=ctr)
    return aes.decrypt(ciphertext[16:])

message =  encrypt_message('abcdef1234567890abcdef1234567890', "oi meu nome e bruno")
print(f'a mensagem criptografada e {message}')

message = decrypt_message('abcdef1234567890abcdef1234567890', message)
print(f'a mensagem descriptografada e {message}')
