function card=shuffle(card)
%shuffle Summary of this function goes here
%The shuffle() function has only one input and only one output.
%The input of this function is a card structure array.
%The output of this function is a card structure array.
%The input is the deck(s) of cards you want to shuffle.
%The output is the shuffled deck(s).
check=numel(card);
if check<52
    error('Does not create enough decks!');
end
for i=1:3000 
    a=randi(check);
    b=randi(check);
    temp=card(a);
    card(a)=card(b);
    card(b)=temp;
end
end

