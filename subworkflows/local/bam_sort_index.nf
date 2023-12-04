

include { SAMTOOLS_SORT  } from '../../modules/local/samtools/samtools_sort.nf'
include { SAMTOOLS_INDEX } from '../../modules/local/samtools/samtools_index.nf'

workflow bam_sort_index {
    take:
        bam

    main:
        sorted_bam_ch       =   SAMTOOLS_SORT   (bam)
        index_bam_ch        =   SAMTOOLS_INDEX  (sorted_bam_ch)

    emit:
        index_bam           =   index_bam_ch
}
