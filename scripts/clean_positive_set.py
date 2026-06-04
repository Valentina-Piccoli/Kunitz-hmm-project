import sys

if __name__ == '__main__':
    pos_set_file = sys.argv[1] #--> file containing the sequences beloging to positive set
    ids_file = sys.argv[2] #--> file containing the ids of the sequence to be remove from postive set

    # 1) Read ids_file and create a list containing all the ids that must be removed from positive set
    ids_to_remove = list()
    with open(ids_file) as file:
        for line in file:
            if line != '':
                ids_to_remove.append(line.strip())
    
    #print(ids_to_remove)
                
    # 2) Read pos_set_file and print only lines that do not correspond to sequences corresponding to ids that must be removed
    print_line = bool()
    with open(pos_set_file) as file:
        for line in file:
            if line.startswith('>'):
                id = line.split('|')[1]
                if id in ids_to_remove:
                    print_line = False
                else:
                    print_line = True
            if print_line:
                print(line.strip())

