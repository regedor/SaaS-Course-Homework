class CartesianProduct < Array
  def initialize(a,b)
    super(a.map {|x| b.map {|y| [x,y]}}.flatten(1))
  end
end

