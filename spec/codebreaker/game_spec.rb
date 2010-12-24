require 'spec_helper'

module Codebreaker
  describe Codebreaker::Game do
    describe '#start' do
      let(:output) { gimme }
      let(:game) { Game.new(output) }
      before { game.start('1234') }

      it 'sends a welcome message' do
        verify(output).puts('Welcome to Codebreaker!')
      end
      
      it 'prompts for the first guess' do
        verify(output).puts('Enter guess:')        
      end
      
      describe '#guess' do
        context 'with no matches' do
          before { game.guess('5555') }       
          it 'sends a mark with ""' do            
            verify(output).puts('')
          end
        end
        
        context 'with 1 number match' do
          before { game.guess('2555') }
          it 'sends a mark with "-"' do
            verify(output).puts('-')
          end          
        end
        
        context 'with 1 exact match' do
          before { game.guess('1555') }
          it 'sends a mark with "+"' do
            verify(output).puts('+')
          end          
        end
        
        context 'with 2 number matches' do
          before { game.guess('2355') }
          it 'sends a mark with "--"' do
            verify(output).puts('--')
          end          
        end 
        
        context 'with 1 number match and 1 exact match (in that order)' do
          before { game.guess('2535') }
          it 'sends a mark with "+-"' do
            verify(output).puts('+-')
          end          
        end       
        
      end
    end
    

  end
end