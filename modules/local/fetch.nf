
process FETCH {

	publishDir "${params.output_dir}/bams", mode: 'copy'
	
    errorStrategy 'retry'
    maxRetries 3

	input:
	    val run 

	output:
	    path "*.bam"

    script:
        prefix = run[0..5]
        """
        wget https://rdp.ucc.ie/static2/${prefix}/${run}.fastq.gz
        """
}