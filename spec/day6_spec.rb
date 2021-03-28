require 'rspec'
require_relative 'spec_helper'
require_relative '../day6/main'

describe Day6::Main do
  let(:input) { File.read('./day6/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 6549 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 3466 }

    include_examples 'part2'
  end
end
