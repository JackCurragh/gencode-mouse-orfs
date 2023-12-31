
process CONFIG {
	
    container 'docker://quay.io/jackcurragh/rdp-tools:latest'

	input:
	    tuple path(bam), path(bai)

	output:
	    tuple path("*.bam", includeInputs: true), path("*.bai", includeInputs: true), emit: bam
        path "config.txt", emit: config

    script:
        """
        echo "${bam.simpleName} ${bam} yes 26,27,28,29 12,12,12,12" >> config.txt
        """
}

// For reference 

//# List the ribosome profiling bam/sam files below and specify the lengths and P-site locations of alignment reads which
// # are most likely originated from the translating ribosomes. If multiple files are defined, their P-site densities along
// # each nucleotide would be added together.


// # Explanation of each column:
// # 1. SampleName: specify a name for each sample
// # 2. AlignmentFile: ribosome profiling alignment file (bam or sam format) at the transcript-level
// # 3. Stranded: Strandedness. Specify 'yes' for stranded interpretation, 'reverse' for reversed strand interpretation, or
// #              "no" for non strand-specific libraries.
// # 4,5. P-siteReadLength, and P-siteOffsets: the read lengths and P-sites locations.
// #      Both of them can be estimated by perform the metagene analysis using our package.
// #      List all lengths or P-site locations which separated by ",".

// # SampleName	AlignmentFile	Stranded(yes/reverse) P-siteReadLength P-siteLocations
// HEK293_ribo HEK293Aligned.toTranscriptome.out.bam yes 26,27,28,29 12,12,12,12