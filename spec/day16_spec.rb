require 'rspec'
require_relative 'spec_helper'
require_relative '../day16/main'

describe Day16::Main do
  let(:input) { File.read('./day16/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 21_071 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 3_429_967_441_937 }

    include_examples 'part2'
  end
end
