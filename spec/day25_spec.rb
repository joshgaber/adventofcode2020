require 'rspec'
require_relative 'spec_helper'
require_relative '../day25/main'

describe Day25::Main do
  let(:input) { File.read('./day25/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 9_620_012 }

    include_examples 'part1'
  end
end
