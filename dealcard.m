function [dealCard,card]=dealcard(card)
%dealcard Summary of this function goes here
% The dealcard() function has only one input and two outputs.
%The input of this function is the card structure array (deck)
%from which you are dealing the card.
if isstruct(card)==0
    error('The input should be a structure array!');
end
dealCard=card(1);
card(1)=[];
end

