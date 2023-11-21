
process METAPLOTS {

    container 'docker://quay.io/biocontainers/ribocode:1.2.15--pyhfa5458b_0'
	
	input:
	    file bam 

	output:
	    tuple path("*.bam") path("*.bai")

    script:
        """
        metaplots -a $params.ribocode_annotation -r $bam 
        """
}