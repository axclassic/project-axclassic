sub EVENT_SAY { 
if($text=~/Hail/i){
my $test = quest::saylink("test", 1);
my $wurk = quest::saylink("wurk", 1);
my $weapon = quest::saylink("weapon", 1);
quest::say("Ya wanna be a member a Da Bashers. duz ya?  What making ya tink yooz is good nuff ta be one o' us?  Can ya proves ta me why I shouldn't oughtta just eat yer smelly hide?  I gonna tests ya. ya big. ugly peece o' meet.  Ya willin ta $test or duz I just eats ya now?"); 
}
if($text=~/test/i){
quest::say("Stoopid meat.  I gonna eats ya anyways sumday.  Brings me a froglok meat and two dem li'l froglok tadpole fleshes.  Dey berry good. Maybe den Ranjor have more $wurk for ya or does ya need a gooder $weapon?."); 
}
if($text=~/weapon/i){
quest::say("Ranjor has lots of dem froggie killin weapons I be willing ta trade. Bring me 2 o dem Rusy Ax and I will give ya someting better.");
}
if($text=~/wurk/i){
quest::say("I have dis mask I don't need no more but I aint gonna give it to ya.");
quest::say("If you bring me 2 Ruined Ash Drakeling Scales and 2 Black Wolf Skins I might be willin ta trade.");
}
}
sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 18790 => 1)){
    quest::say("Arhh.. Ranjor mighty warrior.. Ranjor teach you warrior.. you fight for Ranjor now.");
    quest::summonitem(13528);
	quest::faction(66,10); #Da Bashers
	quest::faction(22,-30); #Broken Skull Clan
    quest::ding();
	quest::exp(1000);
}
elsif (plugin::check_handin(\%itemcount, 5014 => 2)){ #Handin: 2x Rusty Ax
quest::say("Gud Job $name. here take dis, it is better to kill dem froggies with dan dem old rusty tings");
quest::summonitem(quest::ChooseRandom(6042, 7032, 6046, 6041, 5029, 5032, 5029, 5033, 5036, 6019, 5026, 5037, 6021, 5030));
quest::givecash(0,2,0,0);
quest::faction(66,3); #Da Bashers
quest::ding();
quest::exp(500);
}
elsif (plugin::check_handin(\%itemcount, 13409 => 1 &&  13187 => 2)){ #Handin: 2x Froglok Tadpole Flesh & 1x Froglok Meat
quest::say("Dank ye, now me not starve.");
quest::givecash(0,5,0,0);
quest::faction(66,3); #Da Bashers
quest::ding();
quest::exp(500);
}
elsif (plugin::check_handin(\%itemcount, 16167 => 2 &&  13758 => 2)){ #Handin: 2x Ruined Ash Drakeling Scales & 2x Black Wolf Skins 
quest::say("Ya gettin better. One day ya be gud like Ranjor!");
quest::summonitem(2308); #Froglok Skin Mask
quest::faction(66,10); #Da Bashers
quest::ding();
quest::exp(3000);
}
else {
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    quest:say("Me can not eat this... Take back!");
    plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:grobb  ID:40024 -- Ranjor 

