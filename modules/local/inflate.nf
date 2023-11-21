
process INFLATE {
	
	input:
	    file bam 

	output:
	    tuple path("*.bam") path("*.bai")

    script:
        """
        metaplots -a $params.ribocode_annotation -r $bam 
        """
}