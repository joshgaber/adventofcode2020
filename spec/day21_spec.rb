require 'rspec'
require_relative 'spec_helper'
require_relative '../day21/main'

describe Day21::Main do
  let(:input) { File.read('./day21/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 1913 }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 'gpgrb,tjlz,gtjmd,spbxz,pfdkkzp,xcfpc,txzv,znqbr' }

    include_examples 'part2'
  end
end
