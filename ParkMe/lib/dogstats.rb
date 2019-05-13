# Load the dogstats module.
require 'datadog/statsd'

# Create a stats instance.
statsd = Datadog::Statsd.new('localhost', 8125)

# you could also create a statsd class if you need a drop in replacement
# class Statsd < Datadog::Statsd
# end

# Increment a counter.
statsd.increment('page.views')
statsd.increment('messages.count', by: 2, tags: ['kind:incoming'])

# Record a gauge 50% of the time.
statsd.gauge('users.online', 123, sample_rate: 0.5)

# Sample a histogram
statsd.histogram('file.upload.size', 1234)

# Time a block of code
statsd.time('page.render') do
  render_page('home.html')
end

# Send several metrics at the same time
# All metrics will be buffered and sent in one packet when the block completes
statsd.batch do |s|
  s.increment('page.views')
  s.gauge('users.online', 123)
end

# Tag a metric.
statsd.histogram('query.time', 10, tags: ['version:1'])

# Auto-close socket after end of block
Datadog::Statsd.open('localhost', 8125) do |s|
  s.increment('page.views')
end
