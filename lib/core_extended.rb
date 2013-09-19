require 'yaml'
require 'base64'

Dir.glob("#{File.dirname(__FILE__)}/core_extended/*.rb") { |f| require f }