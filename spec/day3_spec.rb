require 'rspec'
require_relative 'spec_helper'
require_relative '../day3/main'

describe Day3::Main do
  let(:input) { File.read('./day3/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 214 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 8_336_352_024 }

    include_examples 'part2'
  end
end
