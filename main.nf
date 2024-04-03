#!/usr/bin/env nextflow

params.param1 = 'default_param1_value'
params.param2 = 'default_param2_value'

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
  
  // Crear un canal para cada parámetro
  val param1_channel = Channel.of(param1_value)
  val param2_channel = Channel.of(param2_value)
  
  // Unir los canales de entrada y pasarlos al proceso
  [param1_channel, param2_channel] | sayHello | view
}

