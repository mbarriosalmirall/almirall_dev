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
  // Definir los valores de los parámetros
  def param1_value = params.param1
  def param2_value = params.param2
  
  // Imprimir los valores de los parámetros para verificar
  println "Param1: $param1_value"
  println "Param2: $param2_value"
  
  // Crear canales individuales para cada parámetro y pasarlos al proceso sayHello
  input_param1 = Channel.of(param1_value)
  input_param2 = Channel.of(param2_value)
  
  // Usar los canales individuales como entradas al proceso sayHello
  input_param1.combine(input_param2).set{ sayHello_ch }

  sayHello_ch | sayHello | view
}
