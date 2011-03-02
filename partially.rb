
class Proc
  
  NOBIND = :_
  def partially(*args_now)
    curried = self.curry(args_now.size)
    lambda do |*args_later|
      evaluated = curried
      args_now.each do |arg|
        evaluated = arg == NOBIND ? evaluated[args_later.pop] : evaluated[arg]
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
