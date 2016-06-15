function printcard(card)
%printcard Summary of this function goes here
%The printcard() function has only one input and no outputs.
%The input of this function is a single card structure.
if isstruct(card)==0
    error('The input should be a STRUCTURE array!');
end
if nargin~=1
    error('The input should be a SINGLE structure array!');
end
for i=1:numel(card)
    if isnumeric(card(i).Num)
        fprintf('%d of %s\n', card(i).Num, card(i).Suit);
    else
        fprintf('%s of %s\n', card(i).Num, card(i).Suit);
    end
end
end

