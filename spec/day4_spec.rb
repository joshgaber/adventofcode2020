require 'rspec'
require_relative 'spec_helper'
require_relative '../day4/main'

describe Day4::Main do
  let(:input) { File.read('./day4/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 219 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 127 }

    include_examples 'part2'
  end
end
