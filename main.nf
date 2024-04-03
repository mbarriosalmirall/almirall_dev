#!/usr/bin/env nextflow

process sayHello {
    input: 
        val param1
    
    output:
        stdout

    script:
        """
        echo '${param1} world!'
        """
}

workflow {
  Channel.of(params.param1) | sayHello | view
}

