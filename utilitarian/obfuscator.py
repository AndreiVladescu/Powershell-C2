import sys

def obfuscate(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        # Simulate obfuscation process
        for line in infile:
            obfuscated_line = line[::-1]  # This is just an example of reversing the line
            outfile.write(obfuscated_line)

def main():
    # Ensure correct number of arguments
    if len(sys.argv) != 3:
        print("Usage: python obfuscator.py xps1.ps1 xps2.ps1")
        sys.exit(1)

    # Input files
    xps1 = sys.argv[1]
    xps2 = sys.argv[2]

    # Output files
    obfuscate(xps1, 'obfuscated_weapons.cmd')
    obfuscate(xps2, 'weapons.cmd')

if __name__ == "__main__":
    main()
