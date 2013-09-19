require 'coverage_helper'
require 'minitest/autorun'
require 'minitest/great_expectations'
require 'turn'
require 'core_extended'

Turn.config do |c|
  c.format = :pretty
  c.natural = true
end
