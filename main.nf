#!/usr/bin/env nextflow

process sayHello {
    input: 
        val param1
        val param2
    
    output:
        stdout

    script:
        """
        echo '${param1} world!'
        echo '${param2} mundo!'
        """
}

workflow {
    Channel.of(params.param1, params.param2) | sayHello(param1, param2)  | view
}

