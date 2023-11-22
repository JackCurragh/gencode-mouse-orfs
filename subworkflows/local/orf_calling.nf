

// Include the necessary modules for this workflow
include { MUDSKIPPER } from '../../modules/local/mudskipper.nf'
include { SAMTOOLS_SORT as SAMTOOLS_SORT_TRANS; SAMTOOLS_SORT as SAMTOOLS_SORT_GENOME } from '../../modules/local/samtools/samtools_sort.nf'
include { INDEX as INDEX_GENOME; INDEX as INDEX_TRANS } from '../../modules/local/samtools/samtools_index.nf'
include { INFLATE } from '../../modules/local/inflate.nf'
include { METAPLOTS } from '../../modules/local/metaplots.nf'
include { RIBOCODE } from '../../modules/local/ribocode.nf'

workflow orf_calling {
    take:
        bam

    main:
        sorted_bam_ch       =   SAMTOOLS_SORT_GENOME    (bam)
        index_bam_ch        =   INDEX_GENOME            (sorted_bam_ch)

        bam_trans_ch        =   MUDSKIPPER              (index_bam_ch)

        inflated_ch         =   INFLATE                 (bam_trans_ch)

        sorted_bam_trans_ch =   SAMTOOLS_SORT_TRANS     (inflated_ch)
        index_bam_trans_ch  =   INDEX_TRANS             (sorted_bam_trans_ch)

        metaplots_ch        =   METAPLOTS               (index_bam_trans_ch)
        ribocode_ch         =   RIBOCODE                (metaplots_ch)
}