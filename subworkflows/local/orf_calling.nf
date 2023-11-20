

// Include the necessary modules for this workflow
include { MUDSKIPPER } from '../../modules/local/mudskipper.nf'
include { SAMTOOLS_SORT as SAMTOOLS_SORT_TRANS, SAMTOOLS_SORT as SAMTOOLS_SORT_GENOME } from '../../modules/local/samtools/samtools_sort.nf'
include { INDEX } from '../../modules/local/samtools/samtools_index.nf'
include { METAPLOTS } from '../../modules/local/metaplots.nf'
include { RIBOCODE } from '../../modules/local/ribocode.nf'

workflow orf_calling {
    take:
        bam

    main:
        sorted_bam_ch       =   SAMTOOLS_SORT_GENOME    (bam)
        bam_trans_ch        =   MUDSKIPPER              (sorted_bam_ch)
        sorted_bam_trans_ch =   SAMTOOLS_SORT_TRANS     (bam_trans_ch)
        index_bam_trans_ch  =   INDEX                   (sorted_bam_trans_ch)
        metaplots_ch        =   METAPLOTS               (index_bam_trans_ch)
        ribocode_ch         =   RIBOCODE                (metaplots_ch)
    emit:
        ribocode_ch
}