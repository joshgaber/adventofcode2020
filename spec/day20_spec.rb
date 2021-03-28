require 'rspec'
require_relative 'spec_helper'
require_relative '../day20/main'

describe Day20::Main do
  let(:input) { File.read('./day20/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 14_129_524_957_217 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 1649 }

    include_examples 'part2'
  end
end
