require 'rspec'
require_relative 'spec_helper'
require_relative '../day12/main'

describe Day12::Main do
  let(:input) { File.read('./day12/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 1533 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 25_235 }

    include_examples 'part2'
  end
end
