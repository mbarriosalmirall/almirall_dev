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

    // Crear canales de entrada para cada parámetro
    def param1Channel = Channel.of(param1_value)
    def param2Channel = Channel.of(param2_value)
  
    // Unir los canales de entrada y enviarlos al proceso sayHello
    (param1Channel, param2Channel).transpose() | sayHello | view
}
