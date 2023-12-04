
process RIBOCODE {

    container 'docker://quay.io/biocontainers/ribocode:1.2.15--pyhfa5458b_0'

    publishDir "${params.output_dir}/RiboCode/", mode: 'copy'
	
    maxForks 1

	input:
	    tuple path(bam), path(bai)
        path(config)
        path(ribocode_annotation)

	output:
	    path "*.bed", emit: bed
        path "*.gtf", emit: gtf
        path "*.txt", emit: txt

    script:
        """
        RiboCode -a $ribocode_annotation -c ${config} -l no -g -b -o ${bam.simpleName}_ORFs 
        """
}