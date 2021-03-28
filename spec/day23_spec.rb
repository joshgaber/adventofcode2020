require 'rspec'
require_relative 'spec_helper'
require_relative '../day23/main'

describe Day23::Main do
  let(:input) { File.read('./day23/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 59_374_826 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 66_878_091_588 }

    include_examples 'part2'
  end
end
