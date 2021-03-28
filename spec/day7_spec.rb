require 'rspec'
require_relative 'spec_helper'
require_relative '../day7/main'

describe Day7::Main do
  let(:input) { File.read('./day7/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 268 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 7867 }

    include_examples 'part2'
  end
end
