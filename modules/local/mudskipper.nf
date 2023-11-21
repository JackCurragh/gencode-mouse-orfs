
process MUDSKIPPER {

    container 'docker://quay.io/biocontainers/mudskipper:0.1.0--h9f5acd7_1'
	
	input:
	    tuple file(bam) file(index)

	output:
	    path "*trans.bam"

    script:
        """
        mudskipper bulk --alignment ${bam} --out ${bam}.trans.bam --index $params.mudskipper_index
        """
}