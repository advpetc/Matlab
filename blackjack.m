%{
Haoyang Chen
ITP 168 - Spring 2016
Homework 7
chenhaoy@usc.edu

Revision History
Date     Changes    Programmer
--------------------------------
3/25/16  Original   Haoyang Chen
%}
function blackjack(numOfDeck)
%blackjack Summary of this function goes here
%The blackjack() function is the main function. 
%It has only one input and no output. 
%The input of the function is a single integer 
%value which represents the number of decks that you will be playing with.
if nargin~=1
    error('Input should be a SINGLE integer!');
end
if numOfDeck<=0
    error('Input should be a POSITIVE integer!');
end
if floor(numOfDeck)~=numOfDeck
    error('Input must be an INTEGER!');
end
pnum=1;
[playerHand(pnum),card]=dealcard(shuffle(initdeck(numOfDeck)));
pnum=pnum+1;
[playerHand(pnum),card]=dealcard(card);
printcard(playerHand);
playerScore=calcscore(playerHand);
fprintf('Player score: %d\n',playerScore);

dnum=1;
[dealerHand(dnum),card]=dealcard(card);
dnum=dnum+1;
[dealerHand(dnum),card]=dealcard(card);
printcard(dealerHand);
dealerScore=calcscore(dealerHand);
fprintf('Dealer score: %d\n',dealerScore);

if playerScore==21
    fprintf('The winner is the player!\n'); 
elseif dealerScore==21
    fprintf('The winner is the dealer!\n');
elseif playerScore==dealerScore
    fprintf('It is a push!\n');
else
    
    while(pnum<5 || dnum<5)
    choice=input('Choose from the following:\n1) Hit\n2) Stand\n');
        if choice==1
            pnum=pnum+1;
            [playerHand(pnum),card]=dealcard(card);
            fprintf('Player was dealt:');
            temp=playerHand(pnum);
            printcard(temp);
            printcard(playerHand);
            playerScore=calcscore(playerHand);
            fprintf('Player score: %d\n',playerScore);
            if playerScore>21
               fprintf('Bust! The dealer wins!\n');
               pnum=6;
               dnum=6;
            end
            if playerScore<21 && pnum==5
                 fprintf('Bust! The player wins!\n');
                 pnum=6;
                 dnum=6;
            end
        elseif choice==2
            dnum=dnum+1;
            [dealerHand(dnum),card]=dealcard(card);
            temp=dealerHand(dnum);
            fprintf('Dealer was dealt:');
            printcard(temp);
            printcard(dealerHand);
            dealerScore=calcscore(dealerHand);
            fprintf('Dealer score: %d\n',dealerScore);
            if dealerScore>21
               fprintf('Bust! The player wins!\n');
               pnum=6;
               dnum=6;
            end
            if dealerScore<21 && dnum==5
               fprintf('Bust! The dealer wins!\n');
               pnum=6;
               dnum=6;
            end
        else
            fprintf('Invaild input! Please choose again\n!');
        end 
    end 
end 
end

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