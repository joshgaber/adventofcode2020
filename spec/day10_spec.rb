require 'rspec'
require_relative 'spec_helper'
require_relative '../day10/main'

describe Day10::Main do
  let(:input) { File.read('./day10/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 2484 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 15_790_581_481_472 }

    include_examples 'part2'
  end
end
