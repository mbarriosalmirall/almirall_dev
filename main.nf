#!/usr/bin/env nextflow

process sayHello {
  input: 
    // Quitamos 'val' de la declaración de variables
    param param1
    param param2
    
  output:
    stdout
  script:
    """
    echo '$param1 $param2 world!'
    """
}

workflow {
  // Definir el canal de entrada con la tupla de valores param1 y param2
  // Usamos 'input' en lugar de 'val' para definir las variables
  inputChannel = Channel.of(tuple(params.param1, params.param2))

  // Ejecutar el proceso sayHello con los valores de param1 y param2 de manera paralela
  inputChannel.into { paramTuple ->
    sayHello(param1: paramTuple[0], param2: paramTuple[1])
  }

  // Visualizar la salida del proceso
  sayHello.out.view()
}
