# Kunitz Domain Profile HMM

**Course:** Laboratory of Bioinformatics I  
**University:** University of Bologna  
**Academic Year:** 2025–2026

## Project Overview

This repository contains all materials for the construction 
and validation of a Profile Hidden Markov Model (HMM) for 
the detection of the Kunitz domain (Pfam: PF00014).

The Kunitz domain is a serine protease inhibitor motif of 
~58 amino acids, stabilized by three conserved disulfide 
bridges (C1–C6, C2–C4, C3–C5). The model was trained on 
10 experimentally determined structures from the RCSB 
Protein Data Bank and validated on a curated sequence 
dataset from UniProt/Swiss-Prot, achieving an MCC of 0.9923 
at an E-value threshold of 1e-5.

---

## Repository Structure
kunitz-hmm/

├── data/

│   ├── raw/          # original PDB tabular report

│   └── processed/    # filtered datasets (CSV, FASTA)

├── structures/

│   ├── full/         # complete PDB files

│   ├── chains/       # extracted Kunitz domain chains (training set)

│   ├── excluded/     # chains removed during MSA refinement

│   └── false_negatives/  # AlphaFold structures of FN sequences

├── clustering/       # MMseqs2 output and representative IDs

├── msa/              # final and intermediate MSA files + RMSD tables

├── model/            # final HMM (kunitz.hmm)

├── validation/

│   ├── ids/          # UniProt/PDB identifier files

│   ├── hmmsearch/    # hmmsearch output and parsed match files

│   ├── cross_validation/  # fold files and optimization results

│   └── false_negatives/   # FN sequences and analysis

├── figures/          # ROC curves, confusion matrices, MCC plots

└── scripts/          # Python scripts and pipeline notebook

---

## Pipeline Overview

| Step | Description | Tool | Input | Output |
|------|-------------|------|-------|--------|
| 1 | PDB query + filtering | Python (pandas) | PDB tabular CSV | `kunitz_clean.fasta` |
| 2a | FASTA conversion | bash (`awk`) | `kunitz_clean.csv` | `kunitz_clean.fasta` |
| 2b | Sequence clustering | **MMseqs2** (external) | `kunitz_clean.fasta` | `mmseqs2_clusters.out` |
| 2c | Representative selection by resolution | Python + RCSB GraphQL API | `mmseqs2_clusters.out` | `pdb_ids.clusters` |
| 3a | PDB download | bash (`wget`) | `pdb_ids.clusters` | `structures/full/*.pdb` |
| 3b | Chain extraction | Python (`get_chain.py`) | full PDB files | `structures/chains/*.pdb` |
| 4a | Multiple structure alignment | **mTM-align** (external) | chain PDB files | MSA + RMSD matrix |
| 4b | Iterative MSA refinement | Python + visual inspection | RMSD matrix + MSA | `kunitz_msa.fasta` |
| 5 | HMM construction | HMMER3 `hmmbuild` | `kunitz_msa.fasta` | `kunitz.hmm` |
| 6a | Validation sets download | **UniProt** (external) | UniProt queries | `positive/negative_kunitz.fasta` |
| 6b | Homology search | HMMER3 `hmmsearch` | `kunitz.hmm` + FASTA | `.search` files |
| 6c | Result parsing + true negatives | Python + bash | `.search` files | `.match` files |
| 6d | Remove training sequences | Python + **UniProt ID Mapping** (external) | positive set + training ids | `cleaned_positive_kunitz.fasta` |
| 7 | Cross-validation + threshold optimization | Python | `.match` files | optimal threshold = `1e-5` |
| 8 | Performance evaluation | Python | full dataset + threshold | confusion matrix, ROC curve, MCC |
| 9 | False negative analysis | Python + **AlphaFold** (external) | FN sequences | structural comparison |

---

## External Tools

The following steps require external web servers:

| Tool | Purpose | URL |
|------|---------|-----|
| MMseqs2 | Sequence clustering | https://mmseqs.com |
| mTM-align | Multiple structure alignment | https://yanglab.qd.sdu.edu.cn/mTM-align/ |
| UniProt ID Mapping | PDB → UniProt ID conversion | https://www.uniprot.org/id-mapping |
| AlphaFold | Structure prediction for FN sequences | https://alphafold.ebi.ac.uk |

---

## Key Results

| Metric | Value |
|--------|-------|
| E-value threshold | 1e-5 |
| MCC | 0.9923 |
| Accuracy | 0.9999 |
| True Positives | 385 / 390 |
| False Negatives | 5 |
| False Positives | 1 |
| True Negatives | 574,228 |

---

## Data Availability

The raw positive and negative sequence datasets are not 
included due to file size. Reproduce them with these 
UniProt queries:

**Positive set** (`positive_kunitz.fasta`):
(reviewed:true) AND (xref:pfam-PF00014)

https://www.uniprot.org/uniprotkb?query=(reviewed:true)%20AND%20(xref:pfam-PF00014)

**Negative set** (`negative_kunitz.fasta`):
(reviewed:true) NOT (xref:pfam-PF00014)

https://www.uniprot.org/uniprotkb?query=(reviewed:true)%20NOT%20(xref:pfam-PF00014)

---

## Requirements

```bash
pip install pandas numpy matplotlib seaborn scikit-learn requests
```

HMMER3 must be installed separately: http://hmmer.org

---

## External Tools

The following steps require external tools not integrated 
in this notebook:

- **MMseqs2**: [mmseqs.com](https://mmseqs.com) — sequence clustering
- **mTM-align**: [yanglab.qd.sdu.edu.cn/mTM-align](https://yanglab.qd.sdu.edu.cn/mTM-align/) — multiple structure alignment  
- **UniProt ID Mapping**: [uniprot.org/id-mapping](https://www.uniprot.org/id-mapping) — PDB → UniProt ID conversion
- **AlphaFold**: [alphafold.ebi.ac.uk](https://alphafold.ebi.ac.uk) — structure prediction for false negatives


---

## References

- Kunitz M, Northrop JH (1936) J. Gen. Physiol. 19:991–1007
- Eddy SR (2011) PLoS Comput. Biol. 7:e1002195
- Steinegger M, Söding J (2017) Nat. Biotechnol. 35:1026–1028
- Dong R et al. (2018) Bioinformatics 34:1719–1725
- Burley SK et al. (2019) Nucleic Acids Res. 47:D464–D474
- UniProt Consortium (2023) Nucleic Acids Res. 51:D523–D531
- Jumper J et al. (2021) Nature 596:583–589