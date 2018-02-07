# experimenting with forks and global variables, forks and ruby subprocesses

$a = 1
fork do # runs the block in a new process
  File.write('./a', $a)
  $b = 1
end
sleep 1
puts $b # => does not return antyhing to stdout, suggests that global variables created in a fork are not accessable in the original scope

File.read('./a')

# Pipe
# Creates a pair of pipe endpoints that are connected to each other, returning them as an array of the two IO objects.
# In the following example, the two processes close the ends of the pipe that are not being used. The read end of the pipe will not generate an end-of-file condition if any writers have the pipe still open.

IO.pipe do |a, b|
  if fork
    puts 1
    b.close
    puts 2
    puts 3
    a.close
    puts 4
    Process.wait
    puts 5
  else
    puts 6
    a.close
    puts 7
    puts "Sending message to parent"
    puts 8
    b.write "Hi Dad"
    puts 9
    b.close
    puts 10
  end
end
