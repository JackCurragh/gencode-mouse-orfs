

process SAMTOOLS_SORT {

    container 'docker://quay.io/biocontainers/samtools:1.18--h50ea8bc_1'
	
	input:
	    file bam 

	output:
	    path("*sorted.bam")

    script:
        """
        samtools sort ${bam} -o ${bam.simpleName}.sorted.bam
        """
}