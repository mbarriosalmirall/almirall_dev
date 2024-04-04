#!/usr/bin/env nextflow

process sayHello {
    input: 
        val param1
        val param2
        val param3

    
    output:
        stdout

    script:
        """
        echo '$param1 $param2 $param3 world!'
        """
}

workflow {
  param1 = Channel.of(params.param1)
  param2 = Channel.of(params.param2)
  param3 = Channel.of(params.param3)
  println param1
  println param2
  println param3
  sayHello(param1, param2, param3) | view
}
