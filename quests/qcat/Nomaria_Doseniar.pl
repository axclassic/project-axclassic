sub EVENT_SAY { 
my $serve = quest::saylink("serve", 1);
if($text=~/Hail/i){
quest::say("Welcome! It is good to see our disciples can still outsmart the guards of Qeynos and make it to the Shrine of Bertoxxulous. Our ranks are best filled with disciples such as yourself. We have need of you. Do you wish to $serve the Lord of Disease or not?");
}
if($text=~/serve/i){
quest::say("Aye! That is good. Of late. we have heard news of a message that will be sent to the Treefolk of the Jaggedpine. Antonius Bayle will send word to the Jaggedpine that certain requests will be met. We must intercept this message. That is all you need to know. Go and find Antonius Bayle's messenger. Gharin. He should have the message. Get it by any means necessary and return it to me. Go now!"); }
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 18716 =>1 )) {
quest::say("Why would you hand me this? Didn't you read it? I swear to Bertoxxlous you Young Clerics just keep getting dumber!");
quest::say("Here take this back and try reading it, maybe then you can find the right trainer $name.");
quest::summonitem(18716);
}
elsif (plugin::check_handin(\%itemcount, 119926 => 1 )) {
quest::faction(21,10);
quest::faction(53,10);
quest::faction(235,10);
quest::faction(135,-30);
quest::faction(257,-30);
quest::say("well done $name.");
quest::say("Now to finish the switch. here take this note to Te'Anara in Surefall glade.");
quest::summonitem(119927);
quest::ding();
quest::exp(2000);
quest::givecash(0,2,8,0);
}
  else {
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
   }
#END of FILE Zone:qcat  ID:45087 -- Nomaria_Doseniar 

