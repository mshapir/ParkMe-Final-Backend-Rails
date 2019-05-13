require 'ddtrace'

Datadog.configure do |c|
  c.use :rails, service_name: 'ParkMe'
end
