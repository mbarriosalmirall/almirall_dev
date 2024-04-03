#!/usr/bin/env nextflow
 
process sayHello {
  input: 
    val x
    val y
  output:
    stdout
  script:
    """
    echo '$x $y world!'
    """
}
 
workflow {
  Channel.of(tuple('Bonjour', 'mon'), tuple('Ciao', 'mondo'), tuple('Hello', 'world'), tuple('Hola', 'mundo')) | sayHello | view
}
