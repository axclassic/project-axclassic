sub EVENT_SAY{
    if($text=~/Hail/i){
     quest::say("Hello $name, it is my pleasure to meet you."); 
     }
    if($text=~/Rhinobeetle/i){
     quest::say("The beetles may be found in the pit surrounding our city of Shar Vahl."); 
     }
    if($text=~/Joharr/i){
     quest::say("Taruun Johar can be found guarding the Prisoners.");
     }
}
sub EVENT_ITEM { 
my $Rhinobeetle = quest::saylink("Rhinobeetle", 1);
my $Joharr = quest::saylink("Joharr", 1);
   if (plugin::check_handin(\%itemcount, 2877 => 1)) {
    quest::say("Ahh, $name, I was told you'd be coming. I am Harbin, and I will oversee the next bit of your progress in the Taruun. You have bravely chosen a path that will put your every skill to the test. May your abilities be honed in the service of the noble Vah Shir. To begin, bring me the soft chitin of three of the Rhinobeetles that dwell in the crater surrounding our city.");
    quest::say("I need three Soft $Rhinobeetle Chitin to help you in your proggression. Collect these and return them to me.");
    quest::summonitem(2877); 
    quest::ding();
    quest::exp(100);
    quest::faction(175,1);
    quest::faction(2806,1)
    }
   elsif (plugin::check_handin(\%itemcount, 3455 => 3)) {
    quest::emote(' takes the chitin and deftly fashions a buckler');
    quest::say("Your progress will be reported, $name. For your effort thus far I present you with this buckler. It will help to protect you until you become adept enough to wield a weapon in each of your hands. Meanwhile, it is time for you to practice the skill that Shar Vahl relies on to feed it's people. Following this recipe, deliver four boiled rockhopper eggs to Sergeant Tylah in Hollowshade moor. Return to me with the acrylia he will pay you.");
    quest::summonitem(18400);
    quest::exp(1000);
    quest::faction(132,10 );
    quest::faction(175,1);
    quest::faction(2806,1); 
    quest::exp(1000);
    quest::faction(132,10 );
    quest::faction(175,1);
    quest::faction(2806,1); 
    }
   elsif (plugin::check_handin(\%itemcount, 3459 => 1)) {
    quest::say("Your progress will be rewarded, $name. Soon all will recognize you as a recruit of the cunning Taruun! Speak with Rytan. When he is through with you return to me with his seal, your buckler, your initiate's cloak and this seal.");
    quest::summonitem(3460);
    quest::exp(1000);
    quest::ding();
    quest::faction( 132,10 );
    quest::faction(175,1);
    quest::faction(2806,1); 
    }
   elsif(plugin::check_handin(\%itemcount, 3460 => 1, 3464 => 1, 18400 => 1, 2878 => 1)){
    quest::say("Your hard work is pleasing to the Taruun, $name, which now accepts you as an official recruit. Wear this cloak with pride. Your buckler has been treated with a special epoxy and should protect you more effectively now. Show the buckler to Taruun $Joharr and he will continue to guide you on your sacred path. I sense a strong spirit in you, young one. May it guide you to greatness!");
    quest::summonitem(3466);
    quest::summonitem(3465);
    quest::shout("Citizens of glorious Shar Vahl, lend me your ears. On this day your fellow citizen, $name, has become an official recruit of the Taruun. He has pledged an oath to hone his skills to perfection that he may better serve us all. Please join me now in celebrating his commitment to the mighty Vah Shir!");
    quest::exp(2000);
    quest::ding();
    quest::faction( 132,10 );
    quest::faction(175,1);
    quest::faction(2806,1); 
   }
   else{
    plugin::return_items(\%itemcount);
   }
}	
#END of FILE Zone:sharvahl  ID:155079 -- Harbin_Gernawl 