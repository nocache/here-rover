ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/autorun'
require 'minitest/spec/expect'
require 'minispec-metadata'
require 'vcr'
require 'minitest-vcr'
require 'webmock'
require 'mocha/setup'
require 'faraday'

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end

MinitestVcr::Spec.configure!
Rake::Task['db:seed'].invoke

class ActiveSupport::TestCase
  fixtures :locations
end
