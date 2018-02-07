require 'net/http'
require 'benchmark'
# comparing running 5 threads calling an endpoint that sleeps for 10 seconds against 5 threads that reduce 1..50000000

# Computational threads:

Benchmark.measure do
  threads = 5.times.map do
    Thread.new do
      (1..50000000).reduce(:+)
    end
  end
  threads.map(&:join)
end

#<Benchmark::Tms:0x007fe61105bb18 @label="", @real=11.496660999953747, @cstime=0.0, @cutime=0.0, @stime=0.03, @utime=11.43, @total=11.459999999999999>

# Threads calling endpoint:

Benchmark.measure do
  threads = 2.times.map do
    Thread.new do
      http = Net::HTTP.new('localhost', 3000)
      resp = http.get('/admin/healthcheck')
    end
  end
  threads.map(&:join)
end

# 1 thread = <Benchmark::Tms:0x007f91440b13a0 @label="", @real=10.138519000029191, @cstime=0.0, @cutime=0.0, @stime=0.0, @utime=0.0, @total=0.0>
# 5 thread = <Benchmark::Tms:0x007fea048c3868 @label="", @real=50.33066500001587, @cstime=0.0, @cutime=0.0, @stime=0.0, @utime=0.010000000000000009, @total=0.010000000000000009>

threads = 2.times.map do
  Thread.new do
    http = Net::HTTP.new('localhost', 3000)
    b = Benchmark.measure do
      resp = http.get('/admin/healthcheck')
    end
    Thread.current[:benchmark] = b.real
  end
end

threads.each do |t|
  t.join
  average = t[:benchmark]/threads.length
end

