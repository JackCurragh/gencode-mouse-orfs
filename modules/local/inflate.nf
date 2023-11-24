
process INFLATE {
	
    container 'docker://quay.io/jackcurragh/rdp-tools:latest'

	input:
	    file bam 

	output:
	    path "*.inflated.bam", emit: inflated_bam

    script:
        """
        RDP-Tools inflate ${bam} 
        """
}