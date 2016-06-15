function score=calcscore(card)
%calcscore Summary of this function goes here
%The calcscore() function has only one input and only one output.
%The input of this function is a card structure array (the cards
%that either the dealer or the player has). The output of this function
%is a single integer value that represents the total value of the 
%structure array (either the player?s score, or the dealer?s score).
if isstruct(card)==0
    error('The input should be a structure array!');
end
sum=0;
for i=1:numel(card)
    sum=sum+card(i).Value;
end
numberOfAce=0;
for j=1:numel(card)
    if strcmp(card(j).Num,'Ace');
        numberOfAce=numberOfAce+1;
    end 
end
while sum>21 && numberOfAce>=1
        sum=sum-10;
        numberOfAce=numberOfAce-1;
end
score=sum;
end

