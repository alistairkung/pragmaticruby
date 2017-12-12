class SomeClass
  def []=(*params)
    value = params.pop
    puts "indexed with #{params.join(', ')}"
    puts "value = #{value.inspect}"
  end
end
