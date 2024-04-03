#!/usr/bin/env nextflow

process sayHello {
    input: 
        val x
    
    output:
        stdout

    script:
        """
        echo '${x} world!'
        """
}

workflow {
    Channel.of(params.x) | sayHello | view
}
