require 'rspec'
require_relative 'spec_helper'
require_relative '../day24/main'

describe Day24::Main do
  let(:input) { File.read('./day24/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 244 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 3665 }

    include_examples 'part2'
  end
end
