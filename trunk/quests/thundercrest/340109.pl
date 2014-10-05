sub EVENT_DEATH {
$client->Message(14,"In an amazing turn of events, you were able to destroy the creator before he could release several more of his dire minions upon you. His death will deal a tremendous blow to the operations of the dragon Yar`Lir, and perhaps cripple any attempt she was to have of driving you and your fellow adventurers out of her realm. Well done!"); 
$client->Message(14,"Return the crystal to camp.");
quest::depop(340001);
quest::depop(340002);
}