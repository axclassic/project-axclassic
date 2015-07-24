sub EVENT_SAY { 
my $forces = quest::saylink("rforces", 1);
my $variety = quest::saylink("variety", 1);
my $enhance = quest::saylink("enhance", 1);
my $wooden = quest::saylink("wooden", 1);
    if($text=~/Hail/i){
     quest::say("Have you come for training young one?  The way of the Beastlord teaches many things about the forces of nature.  The $forces in the thicket are very interesting.");
     }
    if($text=~/forces/i){
     quest::say("Yes, the force that compels a creature to adjust to their surroundings in particular.  The Saruek have seem to adapted to their environment very well.  I am studying the effects of their claws.   It seems the different $variety of Saruek have special enhancements.");
     }
    if($text=~/variety/i){
     quest::say("Well, for example the Firefall Saruek can attack with claws that burn the flesh, the Deathmaw attack with poisonous claws. the shredder Saruek are especially skilled in fending off the Tegi that threaten them, and lastly there is a more uncommon Claw Beast that is very strong but does not appear that often.  I believe I could take their claws and affix them to a weapon to $enhance it.");
     }
    if($text=~/enhance/i){
     quest::say("If you would like to test this theory go hunt these Saurek.  Bring me three claws each for Deathmaw, Firefall, and Shredder.  Due to the reported size of the Claw Beast I only need his talons.  Along with these claws bring me a $wooden practice flail to fasten the claws to.  Go now I have many trainees waiting to be taught.");
     }
    if($text=~/enhance/i){
     quest::say("The flail can be purchased from Kogar in either the City of Shar Vahl or in Kerra Isle.");
     }
}
sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 7808 =>3, 30579 => 1)){
     quest::say(" Well done $name, Use this wisely.");
     quest::summonitem(7815);
     quest::say("Excellent work, $name. Please take this as a reward.");
    quest::exp(2500);
    quest::faction(132,10);
     }
    elsif(plugin::check_handin(\%itemcount, 7807 =>3, 30579 => 1)){
     quest::say(" Well done $name, Use this wisely.");
     quest::summonitem(7813);
     quest::say("Excellent work, $name. Please take this as a reward.");
    quest::exp(2500);
    quest::faction(132,10);
     }
    elsif(plugin::check_handin(\%itemcount, 7809 =>3, 30579 => 1)){
     quest::say(" Well done $name, Use this wisely.");
     quest::summonitem(7814);
     quest::say("Excellent work, $name. Please take this as a reward.");
    quest::exp(2500);
    quest::faction(132,10);
     }
    elsif(plugin::check_handin(\%itemcount, 7811 =>1, 30579 => 1)){
     quest::say(" Well done $name, Use this wisely.");
     quest::summonitem(7812);
     quest::say("Excellent work, $name. Please take this as a reward.");
    quest::exp(2500);
    quest::faction(132,10);
     }
   else{
     #do all other handins first with plugin, then let it do disciplines
     plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
     plugin::return_items(\%itemcount);
     }
}
#END of FILE Zone:shadeweaver  ID:165168 -- Captain_Alim 
