Gem::Specification.new do |s| 
  s.name          = "anagram"
  s.summary       = "Find anagrams of words supplied on the command line"
  s.description   = "Following distribution guide in Pragmatic Programmers' Ruby Guide"
  s.requirements  = ['An installed dictionary']
  s.version       = "0.0.1"
  s.author        = "Dave Thomas"
  s.email         = "dave@pragprog.com"
  s.homepage      = "http://pragdave.pragprog.com"
  s.files         = Dir['**/**']
  s.executables   = ['anagram']
  s.test_files    = Dir["test/test*.rb"]
  s.has_rdoc      = false
end
