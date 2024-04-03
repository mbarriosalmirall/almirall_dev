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
  // Desempaqueta la tupla de entrada en los parámetros param1 y param2
  Channel.of(tuple(params.param1, params.param2)) | { param1, param2 -> sayHello(param1: param1, param2: param2) } | view
}
