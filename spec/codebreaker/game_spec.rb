require 'spec_helper'

module Codebreaker
  describe Codebreaker::Game do
    let(:output) { gimme }
    let(:game) { Game.new(output) }
    before { game.start('1234') }
    
    describe '#start' do
      it 'sends a welcome message' do
        verify(output).puts('Welcome to Codebreaker!')
      end
      
      it 'prompts for the first guess' do
        verify(output).puts('Enter guess:')        
      end
    end
    
    describe '#guess' do
      before { game.guess('1234') }
      it 'sends the mark output' do
        verify(output).puts('++++')
      end
    end
  end
end