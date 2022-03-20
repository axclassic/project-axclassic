# Magics of Fear Quest
# NPC: Cabilis East (cabeast) >> Sarviksa Tiths (106147)

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 6572 => 1)) { #Words of Terror
      quest::say("Though Rthsirez's delays have been... displeasing, I must admit that we are fortunate to have this translation. I see that you are his errand lackey then, $name? Very well. You shall be lackey as well so that I can complete my work. Combine an Ancient Iksar Bone Inkwell and a Spectral Iksar's Essence in this Small Bone Box, and then return it to me.");
      quest::summonitem(6574); #Small Bone Box
   }
   elsif(plugin::check_handin(\%itemcount, 6578 => 1)) { #Sealed Bone Box
      quest::say("Just like Rthsirez, your timing could use some improvement... but I suppose it does not matter at this point, for I shall never have to see you again. I have scribed the Invocation of Fear, and it is yours to return to Rthsirez. However, do not neglect the other items that he requested!");
      quest::summonitem(120343); #Invocation of Fear
   }
   else {
      plugin::return_items(\%itemcount);
   }
}
#END of FILE Zone:Cabilis East (cabeast) >> Sarviksa Tiths (106147)

