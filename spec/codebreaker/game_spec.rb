require 'spec_helper'

module Codebreaker
  describe Codebreaker::Game do
    describe '#start' do
      let(:output) { gimme }
      let(:game) { Game.new(output) }
      before do
        game.start
      end

      it 'sends a welcome message' do
        verify(output).puts('Welcome to Codebreaker!')
      end
      
      it 'prompts for the first guess' do
        verify(output).puts('Enter guess:')        
      end
    end
  end
end