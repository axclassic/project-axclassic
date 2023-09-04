#Drelynn_Beaufax.pl
#Drelynn's Gem Collection


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("A fine day to you, $name. The exhibit you will see here soon will likely be the most valuable of them all. My display will house some of the most precious and rare gemstones you will ever find. It is too sad there are still spaces missing in my display box, if I could only find a few more [gems] to fill them out.");
  }
  if($text=~/gems/i) {
    quest::say("To make the exhibit truly stand out, I would need to add a Blackened Sapphire, Greenscale Emerald, Shimmering Velium Ruby, and a Hope Diamond. Could I perhaps procure these from you? Visit [Merri] and get a Collector's Box from her. Carefully place the gems inside and close it up. Once you return this to me, I can pay you for your services.");
  }
  if($text=~/merri/i) {
    quest::say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28077 => 1)) {#Collection of Gems
    quest::emote("inspects each gem carefully. 'These are in much better condition then I thought I would get them in. Adding these to my exhibit pleases me greatly. As promised, here is something for you.'");
    quest::summonitem(28242);#Fine Antique Veil
  }
  else {
      my $stuff = (\%itemcount);
      my $yes = 2;
      foreach my $k (keys(%{$stuff})) {
          next if($k == 0);
          $yes = 1;
      }
      if($yes == 1) {
          quest::say("I don't need this $name. Take it back.");
          plugin::return_items(\%itemcount);
      }
      if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
          quest::say("Thanks for the coin!");
      }
  }
}#END of FILE Zone:poknowledge  ID:202017 -- Drelynn_Beaufax 

