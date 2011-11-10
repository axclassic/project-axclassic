#zone: gunthak - NPC Vera (224192)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::emote("nearly jumps out of her skin as you address her.  She spins around wildly, spilling ink all down the front of her robe.");
  quest::say("Oh look what you've done! I had kept my robe so clean the entire trip here too!");
  quest::emote("walks away mumbling while she tries to blot out the ink with an old rag.");
 }
}

# You say, 'Hail, Vera'
# Vera nearly jumps out of her skin as you address her.  She spins around wildly, spilling ink all down the front of her robe.  'Oh look what you've done! I had kept my robe so clean the entire trip here too!'
# Vera walks away mumbling while she tries to blot out the ink with an old rag.