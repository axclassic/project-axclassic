# end of luclin smithing, started with Master Barkhem

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18554 => 1)) {
    quest::summonitem("2873");
  }
  if (plugin::check_handin(\%itemcount, 2877 => 1, 2897 => 1)) {
    quest::summonitem("2877");
  }
  # a pair of shadowscream boots 29828, we're sent by Master Barkhem
  if (plugin::check_handin(\%itemcount, 29828 => 1)) {
    quest::say("So you're Barkhem's newest student are you? I may not have taken your word for it, but craftsmanship this fine could only be from a student of our Master Smith. Take this and fill it with Shadowscream steel boots. I need 6 pairs to outfit some of my hunters. When you've finished, return the box to me.");
    quest::summonitem(17499); # receive boot case, 6 slots container
  }
  # give a shadowscream boot case
  if (plugin::check_handin(\%itemcount, 29825 => 1)) {
    quest::emote("inspects the boots for a moment and looks you square in the eyes. 'This is excellent work, $name, you do not disappoint! Would that you could outfit all of my hunters with these boots, but I must not keep your talents all to myself. Take some change for your troubles and this seal back to Barkhem - let him know that I am very impressed with his new protege.'");
    quest::faction(132,10);
     quest::faction(175,1);
    quest::faction(2806,1); 
     quest::ding(); quest::exp(500);
    quest::summonitem(29826); # Rakutah's Seal
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155169 -- Master_Taruun_Rakutah

