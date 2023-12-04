

// Include the necessary modules for this workflow

include { PSITE }                                           from '../../modules/local/psite.nf'
include { RIBOCODE_PSITE }                                  from '../../modules/local/ribocode_psite.nf'

workflow psite_ribocode {
    take:
        inflated_ch
        transcriptome_fasta
        txinfo
        ribocode_annotation

    main:
        psite_ch            =   PSITE                   (inflated_ch, transcriptome_fasta, txinfo)
        ribocode_psite_ch   =   RIBOCODE_PSITE          (psite_ch, ribocode_annotation)
}