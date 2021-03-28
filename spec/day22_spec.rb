require 'rspec'
require_relative 'spec_helper'
require_relative '../day22/main'

describe Day22::Main do
  let(:input) { File.read('./day22/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 32_401 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 31_436 }

    include_examples 'part2'
  end
end
