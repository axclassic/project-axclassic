################################
##      Paladin Epic 1.0      ##
##      Created by Aardil     ##
##        11-23-2013          ##
##     NPCID: 10207 Joshua    ##
##      Zone: freporte        ##
################################

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("Water, I need Water!.'");
   }
} 
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29008 => 1)) { #Bucket of Water
    quest::emote("dips his emaciated hand into the bucket and brings the water to his mouth. As he does, you hear a soft voice in your head.... Thank you $name, Joshua will be fine now because of you.");
    $client->Message(14,"You notice the water in Joshua's hand gleam a pure bright light for a moment.");
	quest::say("Thank you $name. I hope my sister returns soon. I feel better for some reason.");
    quest::summonitem(29009); #Bucket of Pure Water
	}
  else {	
	quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}
