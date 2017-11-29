begin
  File.open('readwrite.rb', 'r') do |file|
    while line = file.gets
      puts line
    end
  end

  File.open('test.rb', 'w') do |file2|
    file2.puts "Created by me"
  end

  rescue Exception => msg
    puts msg
end
