require 'coverage_helper'
require 'minitest/autorun'
require 'turn'
require 'extension'

Turn.config do |c|
  c.format = :pretty
  c.natural = true
end
