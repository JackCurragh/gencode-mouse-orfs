

process PSITE {

    // errorStrategy 'ignore'

    container = 'docker.io/jackcurragh/psite:latest'

    maxForks = 1
	
	input:
	    path(bam)
        path transcriptome_fasta
        path txinfo

	output:
        path "*.psite.bam"
        path "*.log"

    script:
        """
        psite train ${transcriptome_fasta} ${bam} psite ${txinfo}
        psite predict -i ${transcriptome_fasta} ${bam} psite.gbt.pickle ${bam.simpleName}.psite.bam 
        """
}