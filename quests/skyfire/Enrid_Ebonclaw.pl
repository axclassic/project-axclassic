sub EVENT_SAY {
   if($text=~/hail/i) {
      quest::say("Thank you for coming to my aid, though I'm sure I could have made it alive. I'm smarter than most would admit. I even committed a crime against my master by questioning one of his motives and the punishment for that is death. Yet, here I stand! Those wyverns have kept me asleep and were trying to turn me to ash. Since you are here, I will finish what I started. I have a secret so magnificent and so powerful that the Ring of Scale will be extremely angry with me. I will exact my revenge! Now, would you [like to know] how to overcome the wards on the passage to Veeshan's Peak?");
   }
   if($text=~/like to know/i) {
      quest::say("You adventurers are all alike. The dragons erected a new ward on the door to only allow the Ring of Scale and its followers entry. They changed it because of greedy adventurers like you! As a servant to the Ring of Scale, I learned how to create a cipher to enter the peak -- one that overcomes the new ward that was erected. This cipher requires the original key or the essence of the original key. The original key was very magical and powerful, for it encompassed the strength of this continent. If you have the original key, you will need to modify it by combining it with this powerless cipher and the blood of a brood dragon. If you do not have the original key, however, you will need to capture the strength of this continent, the essence of the original key. [continue]");
   }
   if($text=~/continue/i) {
      quest::say("Combine the three major essences with that same dragon blood inside the powerless cipher to create the Cipher of Veeshan, your means of entering the peak.  Also, you may have the original key's essence bound to your soul, so let me know if you would like me to [recreate the key].");
      quest::summonitem("69310");
   }
   if($text=~/recreate the key/i) {
      my $HasKeyInInventory = plugin::check_hasitem($client, 20884);
      if($HasKeyInInventory) {
         quest::emote("searches deeply into your soul and says, 'Mortal, I see you already have the key.'");
      }
      else {
         my $HasKeyOnRing = $client->KeyRingCheck(20884);
         if($HasKeyOnRing){
            quest::emote("searches deeply into your soul and as a spell is cast on you, it says 'Here mortal, here is the physical manifestation of your key. Create the new cipher and exact revenge for me!'");
            quest::summonitem("20884");
         }
         else {
            quest::emote("searches deeply into your soul and says, 'I am sorry mortal, I cannot recreate the key at this time.'");
         }
      }
   }
}

sub EVENT_ITEM {
   plugin::return_items(\%itemcount); # return unused items
}
#Enrid_Ebonclaw