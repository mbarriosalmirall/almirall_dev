#!/usr/bin/env nextflow

process sayHello {
    input: 
        val param1
        val param2
    
    output:
        stdout

    script:
        """
        echo '$param1 $param2 world!'
        """
}

workflow {
  param1 = Channel.of(params.param1)
  param2 = Channel.of(params.param2)
  println param1
  println param2
  sayHello(param1, param2)
}
