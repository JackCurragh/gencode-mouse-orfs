
process INFLATE {
	
	input:
	    file bam 

	output:
	    path "*.inflated.bam", emit: inflated_bam

    script:
        """
        RDP-Tools inflate ${bam} 
        """
}