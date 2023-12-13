

include { transcriptomise_bam }     from './transcriptomise_bam.nf'

include { psite_ribocode }          from './psite_ribocode.nf'
include { ribocode }                from './ribocode.nf'
include { ribotish }                from './ribotish.nf'


workflow orf_calling {
    take:
        bam_ch
        transcriptome_fasta
        genome_fasta
        gtf
        txinfo
        ribocode_annotation
        mudskipper_index

    main:
        if ("${params.transcriptomise_bam}" == true) {
            trans_bam_ch        =   transcriptomise_bam(bam_ch, mudskipper_index)
        }
        else {
            trans_bam_ch        =   bam_ch
        }

        psite_ribocode  (trans_bam_ch, transcriptome_fasta, txinfo, ribocode_annotation)
        // ribocode        (trans_bam_ch, ribocode_annotation)
        // ribotish         (bam_ch, gtf, genome_fasta)
}