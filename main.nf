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
  Channel.of(tuple('Maria', 'David')) | sayHello | view
  }
