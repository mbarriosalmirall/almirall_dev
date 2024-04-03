#!/usr/bin/env nextflow

process sayHello {
    input: 
        val param1
        val param2
    
    output:
        stdout

    script:
        """
        echo '${param1} ${param2} world!'
        """
}

workflow {
  Channel.of(tuple(params.param1, params.param2)) | sayHello(params.param1, params.param2) | view
}


