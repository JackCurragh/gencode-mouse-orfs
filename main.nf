#!/usr/bin/env nextflow

/// Specify to use Nextflow DSL version 2
nextflow.enable.dsl=2

/// Import modules and subworkflows
include { orf_calling } from './subworkflows/local/orf_calling.nf'


// Log the parameters
log.info """\

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
||                        INSERT PIPELINE NAME                             
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
||  Parameters                                                             
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
||  input_dir   : ${params.input_dir}                                     
||  outDir      : ${params.output_dir}                                        
||  workDir     : ${workflow.workDir}                                     
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

"""
// Help Message to prompt users to specify required parameters
def help() {
    log.info"""
  Usage:  nextflow run main.nf --input <path_to_fastq_dir> 

  Required Arguments:

  --input    Path to directory containing fastq files.

  Optional Arguments:

  --outDir	Path to output directory. 
	
""".stripIndent()
}

/// Define the main workflow
workflow {
    /// Define the input channels
    bam_ch = Channel.fromPath("${params.input_dir}/*.bam")
                        .ifEmpty { exit 1, "No BAM files found in ${params.input_dir}" }

    transcriptome_fasta = Channel.fromPath("${params.transcriptome_fasta}")
                        .ifEmpty { exit 1, "No FASTA files found in ${params.input_dir}" }
                        .collect()
    
    txinfo = Channel.fromPath("${params.txinfo}")
                        .ifEmpty { exit 1, "No FASTA files found in ${params.input_dir}" }
                        .collect()

    ribocode_annotation = Channel.fromPath("${params.ribocode_annotation}")
                        .ifEmpty { exit 1, "No FASTA files found in ${params.input_dir}" }
                        .collect()

    mudskipper_index = Channel.fromPath("${params.mudskipper_index}")
                        .ifEmpty { exit 1, "No FASTA files found in ${params.input_dir}" }
                        .collect()

    /// Run the subworkflow
    orf_calling(bam_ch, transcriptome_fasta, txinfo, ribocode_annotation, mudskipper_index)
}

workflow.onComplete {
    log.info "Pipeline completed at: ${new Date().format('dd-MM-yyyy HH:mm:ss')}"
}
