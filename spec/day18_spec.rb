require 'rspec'
require_relative 'spec_helper'
require_relative '../day18/main'

describe Day18::Main do
  let(:input) { File.read('./day18/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 5_019_432_542_701 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 70_518_821_989_947 }

    include_examples 'part2'
  end
end
