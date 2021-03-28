require 'rspec'
require_relative 'spec_helper'
require_relative '../day13/main'

describe Day13::Main do
  let(:input) { File.read('./day13/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 203 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 905_694_340_256_752 }

    include_examples 'part2'
  end
end
