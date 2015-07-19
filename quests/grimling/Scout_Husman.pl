
sub EVENT_SAY {
my $ready = quest::saylink("ready", 1);
    if($text=~/Hail/i) {
     quest::say("Greetings, $name. There is much work to be done, no time for idle chat.");
     }
    if ($text=~/help/i) {
     quest::say("I'm glad to hear it. From our reports, they have a rather small group of soldiers North of here, comprising of two encampments not far from each other. We must begin pushing the Grimlings back to their mines so they cannot continue to have a stronghold in this area. For now, you must gather together a group of soldiers to venture with you to help us clear one of the camps out. When you are $ready to go, inform me of such and I will lead you to the camp where you can make preparations for battle.");
     }
    if ($text=~/ready/i) {
     quest::say("Very well then $name, Follow me.");
     quest::spawn2(167974,0,0,-1136.7,374,6.8,234.5);
     quest::spawn2(167979,0,0,-1136.7,374,6.8,234.5);
     quest::signalwith(167974,7202,0);
     quest::signalwith(167979,7203,10);
     quest::start(1);
     }
}
sub EVENT_WAYPOINT {
    if ($wp == 9) {
     quest::spawn2(167975,0,0,-1234.4,202,44,240);
     quest::depop();
     }
}
sub EVENT_ITEM {
my $help = quest::saylink("help", 1);
    if (plugin::check_handin(\%itemcount,3681=>1)) {
     quest::say("Are you here to $help? You've no doubt heard of the issues with the Grimlings throughout the forest. I fear we may not be able to push them back enough this time to keep our people safe from the dastardly deeds of those vile things. Reports have come in that they may be trying to come at us from the North. While it wouldn't be unheard of, such a move might prove to be a decoy for other attacks coming from the West."); 
     quest::summonitem(3681);
     }
  else{
   plugin::return_items(\%itemcount);
   }
}

#END of FILE Zone:grimling  ID:167134 -- Scout_Husman 
