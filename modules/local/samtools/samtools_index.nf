
process SAMTOOLS_INDEX {

    container 'docker://quay.io/biocontainers/samtools:1.18--h50ea8bc_1'
    
	input:
	    file bam 

	output:
	    tuple path("*.bam", includeInputs:true), path("*.bai")
    script:
        """
        samtools index ${bam}
        """
}