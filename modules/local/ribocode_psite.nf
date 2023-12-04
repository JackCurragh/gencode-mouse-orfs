process RIBOCODE_PSITE {
	
    container 'docker://quay.io/biocontainers/ribocode:1.2.15--pyhfa5458b_0'

    publishDir "${params.output_dir}/RiboCode_psite/", mode: 'copy'

	input:
	    path bam 
        path out_log
        path ribocode_annotation

	output:
        path "*"

    script:
        """
        mkdir orfpred_psite
        python ${projectDir}/scripts/psite_analysis/src/ribocode_config.py ${bam} ${out_log} > ${bam.simpleName}.pre_config
        python ${projectDir}/scripts/psite_analysis/src/RiboCode_psite.py -a ${ribocode_annotation} -c ${bam.simpleName}.pre_config -l no -g -A CTG,GTG,TTG -o orfpred_psite/${bam.simpleName}
        """
}