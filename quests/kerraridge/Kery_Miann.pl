sub EVENT_SAY { 
    if($text=~/Hail/i){
     quest::say("Greetings. young one.  May I help you?");
     }
    if($text=~/weapon/i){
     quest::say("Take this small stone balde and a high quality rockhopper hide, combine them in a sewing kit or a loom to make leather straps.")
     quest::summonitem(5572);
     quest::say(" Bring to me two leather straps and both of your claws, I will fashion you some new weapons."); 
     }
}
sub EVENT_ITEM {
my $weapon = quest::saylink("weapon", 1);
    if(plugin::check_handin(\%itemcount,5571 =>1 )){
     quest::say("Oh! The map of the area, I have been needing this for quite some time as I get lost very easily.");
     quest::say(" You appear to be searching for something also. Could it be you  would be in need of a new $weapon?");
     }
    elsif(plugin::check_handin(\%itemcount, 5581 => 2, 3673 => 1, 3674 => 1)){
     quest::say("I have an errand for you to run as well, take this note to Rittuh Purrik in Hollowshade Moor for her daily reports. Fare well young citizen $name."); 
     quest::summonitem(48047);
     quest::summonitem(120209);
     quest::summonitem(5573);
     }
    elsif(plugin::check_handin(\%itemcount,5577 =>1 )){
     quest::say("You have done very well, youth. I hope that you are beginning to understand what it means to walk the path of Khati Sha. Public service is very important. Our namesake is the fundamental figure in the foundation of this society. Our walls are made of the ore that he discovered. His exploration of the lands that surround our home made it possible for us to live here in peace.");
     quest::say("This leads us to our next lesson. I would like you to seek out the caverns beyond the thicket. A breed of shelled creatures roam the tunnels of those caverns. Occasionally, a strong glow will manifest itself in one of these creatures. Find such a creature and bring me the source of its glow. Wrap the light source in your Khati Sha recruit's cloak and place them both in this box.");
     quest::say("Return to me with the combined item and I shall reward you.");
     quest::summonitem(17610);
     quest::exp(2000);
     quest::ding();
     quest::faction(132,10);
     quest::faction(175,1);
     quest::faction(2806,1);
     }
    elsif(plugin::check_handin(\%itemcount,5579 =>1 )){
     quest::emote(' opens the box and removes your old cloak. She unwraps the orb and looks at it for a moment.');
     quest::say("You have done well, youth.' She says as she picks up what appears to be a new cloak. She hands you the cloak and smiles. 'Your life as a member of our sect may not always be pleasant, but take comfort in the fact that you are performing a great service to your people. Walk the path of the Khati Sha with pride and one day may you see his face as I have. Now, seek out Kaam Rahiir in the libraries. Show him your claws and he will be able to assist you in imbuing them magically. Take care.");
     quest::shout("Citizens of Shar Vahl, take this time to welcome $name to the level of Khati Sha Apprentice. We are all in the debt of each and every citizen that works as hard as $name to improve our city!");
     quest::summonitem(5580):
     quest::say("Locate Kaam Rahiir to continue your studies, he may be in or near the library. Show him your claws."); 
     quest::exp(3000);
     quest::ding();
     quest::faction(132,10);
     quest::faction(175,1);
     quest::faction(2806,1);
     }
    else {
      plugin::return_items(\%itemcount);
     }
}     
#END of FILE Zone:sharvahl  ID:155061 -- Kery_Miann 

