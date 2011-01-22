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
      let(:marker) { gimme_next(Marker) }
      before do
        give(marker).exact_match_count { 4 }
        give(marker).number_match_count { 0 }
        game.guess('1234')
      end
      it 'outputs the exact matches followed by the number matches' do
        verify(output).puts('++++')
      end      
    end
  end
  
end