function card=initdeck(NumOfDeck)
%the function initialize the deck with NumOfDeck
%The initdeck() function has only one input and only one output. 
%The input of this function is a single positive integer value. 
%This value represents the number of decks that the function will 
%be creating. The output of this function is a structure array of cards.
%The number of cards in the structure array is dependent upon the number
%of decks to create.
if isinteger(NumOfDeck)
    error('Input must be an integral');
end
if nargin~=1
    error('Input must be single integral');
end
if NumOfDeck<=0
    error('Input must be a positive number');
end
card=struct('Suit',[],'Value',[],'Num',[]);
for i=1:4
    for j=1:13
        if i==1
            card(j+(i-1)*13).Suit='Hearts';
        end
        if i==2
            card(j+(i-1)*13).Suit='Clubs';
        end
        if i==3
            card(j+(i-1)*13).Suit='Diamonds';
        end
        if i==4
            card(j+(i-1)*13).Suit='Spades';
        end
    end 
end

for k=1:4
    for f=2:10
        card(f+(k-1)*13).Num=f;
        card(f+(k-1)*13).Value=f;
    end
end

for i=1:13:40
    card(i).Num='Ace';
    card(i).Value=11;
end

for i=1:4
    for j=11:13
        card(j+(i-1)*13).Value=10;
    end
end

for j=11:13:50
    card(j).Num='Jack';
end
for j=12:13:51
    card(j).Num='Queen';
end
for j=13:13:52
    card(j).Num='King';
end
card=repmat(card,1,NumOfDeck);
end