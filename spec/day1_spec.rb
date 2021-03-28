require 'rspec'
require_relative 'spec_helper'
require_relative '../day1/main'

describe Day1::Main do
  let(:input) { File.read('./day1/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 876_459 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 116_168_640 }

    include_examples 'part2'
  end
end
