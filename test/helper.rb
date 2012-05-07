require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'minitest/unit'
require 'minitest/spec'
require 'mocha'

require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'virtual_box'

class MiniTest::Unit::TestCase
end

Dir[File.expand_path('helpers/**/*.rb', File.dirname(__FILE__))].
    each { |h| require h }

MiniTest::Unit.autorun
