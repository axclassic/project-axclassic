# end of luclin smithing, started with Master Barkhem
sub EVENT_SAY { 
    if($text=~/Hail/i){
     quest::say("Greetings $name. are you one of our new recruits?");
     }
}
sub EVENT_ITEM { 
my $sense - quest::saylink("sence", 1);
my $Ranger = quest::saylink("Ranger", 1);
my $Band = quest::saylink("Band", 1);
    if(plugin::check_handin(\%itemcount,18554 => 1)){
     quest::say("$name. welcome to the Rogue guild  The Taruun. You have grown strong in the safety of our city and it is now time for you to register for official citizenship of Shar Vahl. I, Master Taruun Rakutah have granted your request of inclusion and deem you to be worthy of our training. Take this application to Registrar Bindarah and return to me with proof of your citizenship.");
     quest::say("I know that you may be nervous right now... after all. this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar. just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
     quest::summonitem("2873");
      quest::ding();
     quest::exp(50);
     }
    elsif(plugin::check_handin(\%itemcount, 2897 => 1, 2877 => 1)){
     quest::say("$name, citizen of Shar Vahl, accept this cloak as a symbol of your loyalty and service to our noble people. It will grow with you, young initiate, and like you it has incredible potential.  If you wish to complete further tasks, you should talk to Harbin Gernawl.  Farewell.");
     quest::say(" In order to return to Kerra Isle, locate the Soulbinder nearest you in the area you are huning, and them $sense. They will return you to your home city");
     quest::say("May I also suggest that you find $Ranger $Band, he has a quest for you that will give you a stone that will get you to Shadeweavers Thicket which is close to the old city of Shar Vahl. To return to Kerra Isle, you would need to find the stone of origin.");
     quest::summonitem(2878);
     quest::summonitem(2877);
     quest::ding();
     quest::exp(100);
     quest::faction(175,1);
     quest::faction(2806,1);  
     }
    elsif(plugin::check_handin(\%itemcount,2897 => 1)){
     quest::say("This item means nothing to me by itself");
     quest::summonitem(2897);
     }
    elsif(plugin::check_handin(\%itemcount,2877 => 1)){
     quest::say("This item, by itself means nothing to me.");
     quest::summonitem(2877);
     }
    elsif (plugin::check_handin(\%itemcount, 29828 => 1)) {
     quest::say("So you're Barkhem's newest student are you? I may not have taken your word for it, but craftsmanship this fine could only be from a student of our Master Smith. Take this and fill it with Shadowscream steel boots. I need 6 pairs to outfit some of my hunters. When you've finished, return the box to me.");
     quest::summonitem(17499);
     }
    elsif (plugin::check_handin(\%itemcount, 29825 => 1)) {
     quest::emote("inspects the boots for a moment and looks you square in the eyes. 'This is excellent work, $name, you do not disappoint! Would that you could outfit all of my hunters with these boots, but I must not keep your talents all to myself. Take some change for your troubles and this seal back to Barkhem - let him know that I am very impressed with his new protege.'");
     quest::summonitem(29826);
     quest::ding();
     quest::exp(500);
     quest::faction(175,1);
     quest::faction(2806,1); 
     }
   else{
     #do all other handins first with plugin, then let it do disciplines
     plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
     plugin::return_items(\%itemcount);
     }
}
#END of FILE Zone:sharvahl  ID:155169 -- Master_Taruun_Rakutah

