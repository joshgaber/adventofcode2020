require 'rspec'
require_relative 'spec_helper'
require_relative '../day14/main'

describe Day14::Main do
  let(:input) { File.read('./day14/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 4_297_467_072_083 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 5_030_603_328_768 }

    include_examples 'part2'
  end
end
