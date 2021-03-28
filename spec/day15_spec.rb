require 'rspec'
require_relative 'spec_helper'
require_relative '../day15/main'

describe Day15::Main do
  let(:input) { File.read('./day15/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 866 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 1_437_692 }

    include_examples 'part2'
  end
end
