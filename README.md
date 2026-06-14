# Kunitz Domain Profile HMM — Pipeline Notebook

This notebook documents the full pipeline for the construction 
and validation of a profile Hidden Markov Model (HMM) for the 
Kunitz domain (Pfam: PF00014).

---

## Pipeline Overview

| Step | Description | Tool | Input | Output |
|------|-------------|------|-------|--------|
| 1 | PDB query and filtering | Python (pandas) | PDB tabular report | `kunitz_clean.fasta` |
| 2a | FASTA conversion | bash (awk) | `kunitz_clean.csv` | `kunitz_clean.fasta` |
| 2b | Sequence clustering | MMseqs2 (web/CLI) | `kunitz_clean.fasta` | `mmseqs2_clusters.out` |
| 2c | Representative selection | Python (RCSB API) | `mmseqs2_clusters.out` | `pdb_ids.clusters` |
| 3a | PDB download | bash (wget) | `pdb_ids.clusters` | `structures/full/*.pdb` |
| 3b | Chain extraction | Python (`get_chain.py`) | full PDB files | `structures/chains/*.pdb` |
| 4a | Multiple structure alignment | mTM-align (web server) | chain PDB files | MSA + RMSD matrix |
| 4b | MSA refinement | Python + visual inspection | RMSD matrix + MSA | `kunitz_msa.fasta` |
| 5 | HMM construction | HMMER3 `hmmbuild` | `kunitz_msa.fasta` | `kunitz.hmm` |
| 6a | Download validation sets | UniProt (web) | UniProt queries | `positive/negative_kunitz.fasta` |
| 6b | Homology search | HMMER3 `hmmsearch` | `kunitz.hmm` + fastas | `.search` files |
| 6c | Parse results | Python + bash | `.search` files | `.match` files |
| 6d | Remove training sequences | Python + UniProt ID Mapping | positive set + training ids | `cleaned_positive_kunitz.fasta` |
| 7 | Cross-validation | Python | `.match` files | optimal threshold = 1e-5 |
| 8 | Performance evaluation | Python | full dataset + threshold | confusion matrix, ROC, MCC |
| 9 | False negative analysis | Python + AlphaFold | FN sequences | structural comparison |

---

## External Tools

The following steps require external tools not integrated 
in this notebook:

- **MMseqs2**: [mmseqs.com](https://mmseqs.com) — sequence clustering
- **mTM-align**: [yanglab.qd.sdu.edu.cn/mTM-align](https://yanglab.qd.sdu.edu.cn/mTM-align/) — multiple structure alignment  
- **UniProt ID Mapping**: [uniprot.org/id-mapping](https://www.uniprot.org/id-mapping) — PDB → UniProt ID conversion
- **AlphaFold**: [alphafold.ebi.ac.uk](https://alphafold.ebi.ac.uk) — structure prediction for false negatives

---

## Requirements

```python
pandas, numpy, matplotlib, seaborn, scikit-learn, requests
```
HMMER3 must be installed system-wide (`hmmbuild`, `hmmsearch`).