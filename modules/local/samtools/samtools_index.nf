
process INDEX {

    container 'docker://quay.io/biocontainers/samtools:1.18--h50ea8bc_1'
	
	input:
	    file bam 

	output:
	    tuple path("*.bam") path("*.bai")

    script:
        """
        samtools index ${bam}
        """
}