import sys

if __name__ == '__main__':
    pdb_file = sys.argv[1]
    chain = sys.argv[2] #--> chain ww are looking for in the pdb file

    # Read the pdb file and print just the line starting with 'ATOM'
    with open(pdb_file) as file:
        for line in file:
            if line.startswith('ATOM') and line[21]==chain:
                print(line.strip())
