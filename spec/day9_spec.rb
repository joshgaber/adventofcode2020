require 'rspec'
require_relative 'spec_helper'
require_relative '../day9/main'

describe Day9::Main do
  let(:input) { File.read('./day9/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 20_874_512 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 3_012_420 }

    include_examples 'part2'
  end
end
