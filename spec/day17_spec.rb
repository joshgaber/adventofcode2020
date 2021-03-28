require 'rspec'
require_relative 'spec_helper'
require_relative '../day17/main'

describe Day17::Main do
  let(:input) { File.read('./day17/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 291 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 1524 }

    include_examples 'part2'
  end
end
