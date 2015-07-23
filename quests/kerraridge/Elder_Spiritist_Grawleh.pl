sub EVENT_SAY { 
    if($text=~/Hail/i){
     quest::say("Greetings, young one. If you are here for training you must first present to me the note you were given.");
     }
}
sub EVENT_ITEM {
my $Ranger = quest::saylink("Ranger", 1);
my $Band = quest::saylink("Band", 1);
    if(plugin::check_handin(\%itemcount, 2897 =>1, 2877 => 1)){
     quest::say("Welcome back, $name! I see that your documents are in order and you are an official citizen of Shar Vahl, which is great news! Let me be the first to welcome you to the ranks of the Dar Khura! Here, take this cloak and wear it with pride.");
     quest::say("Present your acrylia slate to spiritist Fehril and he will guide you through your early training. May the strongest of our ancestral spirits be your inspiration.");
     quest::summonitem(2878);
     quest::summonitem(2877);
     quest::ding();
     quest::exp(500);
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
    elsif(plugin::check_handin(\%itemcount,18551 => 1)){
     quest::say("Welcome, $name! We are glad you have come to us for training, and so we should not waste any time. However, in order to join the Dar Khura, you must first become a citizen. Here, take this citizen application and visit Registrar Bindarah. Once you are a full citizen, return here with your citizenship papers, and we will continue.");
     quest::summonitem(2873);
     quest::ding();
     quest::exp(50);
     }
    elsif (plugin::check_handin(\%itemcount, 2897 => 1)) {
     quest::say("Welcome back, $name! I see that your documents are in order and you are an official citizen of Shar Vahl, which is great news! Let me be the first to welcome you to the ranks of the Dar Khura! Here, take this cloak and wear it with pride.");
     quest::say("Present your acrylia slate to spiritist Fehril and he will guide you through your early training. May the strongest of our ancestral spirits be your inspiration.");
     quest::say(" May I also suggest that you fing $Ranger $Band, he has a quest for you that will give you a stone that will get you to Shadeweavers Thicket which is close to the old city of Shar Vahl. To return to Kerra Isle, you would need to find the stone of origin.");
     quest::summonitem(2878);
     quest::ding();
     quest::exp(100);
     quest::faction(175,1);
     quest::faction(2806,1);
     }
   else{
      #do all other handins first with plugin, then let it do disciplines
      plugin::try_tome_handins(\%itemcount, $class, 'Shaman');
      plugin::return_items(\%itemcount);
     }
}
#END of FILE Zone:sharvahl  ID:155167 -- Elder_Spiritist_Grawleh 

