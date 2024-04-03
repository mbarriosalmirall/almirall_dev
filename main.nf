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
    
    // Crear un canal con la tupla de los valores de los parámetros
    val param_channel = Channel.of(tuple(param1_value, param2_value))
    
    // Usar el canal como entrada para el proceso sayHello
    param_channel | sayHello | view
}

