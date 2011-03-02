
class Proc
  
  NOBIND = (MATCH_ONE, MATCH_ALL = :_, :*)
  def partially(*args_now)
    uncurried = self
    lambda do |*args_later|
      arity = args_now.include?(MATCH_ALL) ? (args_now.size + args_later.size - 1) : args_now.size
      evaluated = uncurried.curry(arity)
      args_now.each do |arg|
        evaluated = NOBIND.include?(arg) ? evaluated[args_later.pop] : evaluated[arg]
        if arg == MATCH_ALL
          args_later.each do |late_arg|
            evaluated = evaluated[late_arg]
          end
          break
        end
      end
      evaluated
    end
  end

end

class Symbol

  def partially(*args_now)
    self.to_proc.partially(*args_now)
  end

end
