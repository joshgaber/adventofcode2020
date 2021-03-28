require 'rspec'
require_relative 'spec_helper'
require_relative '../day19/main'

describe Day19::Main do
  let(:input) { File.read('./day19/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 180 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 323 }

    include_examples 'part2'
  end
end
