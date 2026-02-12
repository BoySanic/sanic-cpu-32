import sys
with open(sys.argv[1], "rb") as f:
    byte_data = f.read()

binary_string = ""
byte_counter = 0
for byte in byte_data:
    binary_string += bin(byte)[2:].zfill(8)
    byte_counter += 1
    if byte_counter == 4:
        byte_counter = 0
        binary_string += "\n"
print(binary_string)
