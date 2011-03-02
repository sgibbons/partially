# Partially - flexible partial function application for ruby

## Basic Usage

    irb> require 'partially'
    
    # arguments that have the placeholder :_ will be bound later, all others bound now
    irb> replace_dog = :gsub.partially :_, 'dog', :_

    irb> statements = ['I like dogs', 'dogs have fur', 'my dog is great']

    # bind the deferred arguments (each statement and 'cat' in this case)
    irb> statements.map &replace_dog['cat'] 
    ['I like cats', 'cats have fur', 'my cat is great']
    
    # rebind the deferred arguments to something different
    irb> statements.map &replace_dog['cow'] 
    ['I like cows', 'cows have fur', 'my cow is great']

## Features

  * Bind some arguments now, others later, regardless of order (very verbose to do with straight Proc#curry)

  * Works with var-args: :\* ('match the rest') allows for the production of var-args functions from partial application
      
      irb> sum = ->(*n) { n.inject(&:+) }
      irb> sum[1, 2, 3]
      6
      irb> addAllToOne = sum.partially 1, :*
      irb> addAllToOne[2,4]
      7

  * Function arity is inferred automatically (unlike Proc#curry)
