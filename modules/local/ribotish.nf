

process RIBOTISH {

    container 'docker://quay.io/jackcurragh/ribotish:latest'

    publishDir "${params.output_dir}/RiboTISH/", mode: 'copy'
	
    maxForks 1

	input:
	    tuple path(bam), path(bai)
        path(gtf)
        path(genome_fasta)

	output:
        path "*pred.txt", emit: txt
        path "*pred_all.txt", emit: all_txt

    script:
        """
        ribotish predict -b ${bam} -g ${gtf} -f ${genome_fasta} --framebest --altcodons CTG,GTG,ACG -o ${bam.simpleName}_pred.txt
        """
}