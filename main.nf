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
  // Definir los parámetros como variables separadas
  def param1_value = params.param1
  def param2_value = params.param2
  
  // Crear una tupla de parámetros
  def params_tuple = tuple(param1_value, param2_value)
  
  // Crear un canal con la tupla de parámetros
  Channel.of(params_tuple) | sayHello | view
}

