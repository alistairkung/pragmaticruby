def search(field,options)
  options = { duration:120 }.merge(options)
  if options.has_key?(:duration)
    duration = options[:duration]
    options.delete(:duration)
  end
  if options.has_key?(:genre)
    duration = options[:genre]
    options.delete(:genre)
  end
  fail "Invalid options: #{options.keys.join(', ')}" unless options.empty?
end
