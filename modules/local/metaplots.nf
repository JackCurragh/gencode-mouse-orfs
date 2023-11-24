
process METAPLOTS {

    errorStrategy 'ignore'

    container 'docker://quay.io/biocontainers/ribocode:1.2.15--pyhfa5458b_0'
	
	input:
	    tuple path(bam), path(bai)
        path ribocode_annotation

	output:
	    tuple path("*.bam"), path("*.bai"), emit: bam
        path "config.txt", emit: config

    script:
        """
        metaplots -a $ribocode_annotation -r $bam 
        """
}