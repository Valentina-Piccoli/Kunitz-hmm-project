import sys
import numpy as np

# Function that convert an input file (containing the info about the proteins_id, the e_value obtained by the hmmsearch and the true class label) into a list of tuples, one tuple for each row
def get_predictions(file_name):
    predictions = list() #--> list of tuples (protein_id, e-value of best match, class_label)
    with open(file_name) as file:
        for line in file:
            l = line.strip().split() # protein_id best_match_id e-value
            predictions.append((l[0], float(l[1]), int(l[2]))) 
    return predictions

# Function that compute the confusion matrix given in input a list of tuples (protein_id, e-value of best match, class_label) and a threshold value
def get_confusion_matrix(predictions, threshold=0.001): #
    cmatrix = np.zeros((2,2))

    for pred in predictions: 
        # pred = (protein_id, e-value of best match, class_label)
        i = pred[2] # --> true label
        j = 0 # --> predicted label 
        if pred[1] <= threshold: j=1

        cmatrix[i,j] += 1

    return cmatrix

def get_accuracy(cmatrix):
    return (cmatrix[0,0] + cmatrix[1,1])/np.sum(cmatrix)

# Function that compute the Mattew Crrelation Coefficient
def get_mcc(cmatrix):
    # In the case of kunit domain: 
    # - negative=0 --> absence of kunitz domain
    # - positive=1 --> presence of kunitz domain
    TP = cmatrix[1,1]
    TN = cmatrix[0,0]
    FP = cmatrix[1,0]
    FN = cmatrix[0,1]
    
    return ((TP * TN) - (FP*FN)) / np.sqrt(((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)))


if __name__ == '__main__':
    file_name = sys.argv[1]
    threshold = float(sys.argv[2])

    predictions = get_predictions(file_name)
    confusion_matrix = get_confusion_matrix(predictions, threshold)
    print(confusion_matrix)
    
    accuracy = get_accuracy(confusion_matrix)
    mcc = get_mcc(confusion_matrix)

    print(f'TH: {threshold}, Q2: {accuracy}, MCC: {mcc}')

