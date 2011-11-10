######################################
## NPC: Exterminator_Gilea ##
## Zone: Neriakc ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $bat = quest::saylink("bat", 1);
if($text=~/Hail/i){
$client->Message(14,"Greetings, traveller. How would you like to make some money? I was brought in to kill some of these rodents that have been infesting the city but there are simply way too many of them. If you can kill some of the rodents around here and bring me four rat whiskers, perhaps I could find some spare coin for you.");
$client->Message(14,"If you are looking for $bat wings, I can also help you with that.");
}
elsif ($text=~/bat/i){
$client->Message(14,"I have many bat wings collected on my trips around Norrath, bring me one piece of rat fur, and I will give you a bat wing in return.");
}
}
sub EVENT_ITEM {
if($itemcount{13064} == 1){
$client->Message(14,"Thank you and here is your batwing.");
quest::summonitem(13068); #Batwing
}
elsif(plugin::check_handin(\%itemcount, 13071 => 4)){ #Handin: 4x Rat Whiskers
$client->Message(14,"Well there are still many rodents around but I will honor my deal. Here are your coins. Now I must get back to work.");
quest::faction(87,10); # +Dreadguard Inner
quest::faction(88,10); # +Dreadguard Outer
quest::faction(155,10); # +Indigo Brotherhood
quest::faction(260,-10); # -Primordial Malice
quest::ding(); quest::exp(5);
quest::givecash(1,1,1,1);
}
else {
plugin::return_items(\%itemcount);
$client->Message(14,"I don't need these, it is NOT what i asked for. Here $name take them back.");
}
}