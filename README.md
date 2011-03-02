# Partially - flexible partial function application for ruby

## Basic Usage

    irb> require 'partially'

    irb> replace_dog = :gsub.partially(:_, 'dog', :_) # arguments that have the placeholder :_ will be bound later, all others bound now

    irb> statements = ['I like dogs', 'dogs have fur', 'my dog is great']
    
    irb> statements.map &replace_dog['cat'] # bind the deferred arguments (each statement and 'cat' in this case)

    ['I like cats', 'cats have fur', 'my cat is great']

    irb> statements.map &replace_dog['cow'] # rebind the deferred arguments to something different

    ['I like cows', 'cows have fur', 'my cow is great']

## Features

  * Bind some arguments now, others later, regardless of order (very verbose to do with straight Proc#curry)

  * Works with var-args (use a trailing :\* token)
      
      irb> sum = ->(*n) { n.inject(&:+) }

      irb> sum[1, 2, 3]

      irb> addAllToOne = sum.partially 1, :*

      irb> addAllToOne[2,4]

      7

  * Function arity is inferred automatically (unlike Proc#curry)


