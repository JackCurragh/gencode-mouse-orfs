# Gencode Mouse ORF prediciton Pipeline
## Introduction 

Pipeline predicts Mouse ORFs from Ribo-Seq data using RiboSeq.Org Data Portal
## Requirements 
This pipeline can be run using each of the following container methods
| Method      | Instructions                                                                                   |
| ----------- | ---------------------------------------------------------------------------------------------- |
| Singularity | [docs.syslabs.io](https://docs.sylabs.io/guides/3.0/user-guide/installation.html)              |
| Docker      | [docs.docker.com](https://docs.docker.com/engine/install/)                                     |
| Conda       | [docs.conda.io](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html)  |


## Setup
##### Singularity
```
sudo singularity build singularity/pipeline Singularity
```
Then as the profile `singularity` specifies `container = 'singularity/pipeline'` use the following to execute:
```
nextflow run main.nf -profile singularity
```

