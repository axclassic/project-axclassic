######################################
## NPC: Exterminator_Rasmon
## Zone: Quenos
## Revised by caved for AX-CLASSIC 
## EQWorld Server
######################################
sub EVENT_SAY {
if($text=~/Hail/i){
#Start of Exterminate the Vermin Quest (Scripted By: Fatty Beerbelly)
$client->Message(14,"Hello, $name. Have you seen these pesky rodents? They are everywhere, and I simply cannot stand them! If you are willing to do a little cleaning up of the pests here, I will reward you for every four rat whiskers you bring me. I can also trade your beetle legs for spider legs if you ever may need them. Just give me one at a time.");
 }
}
sub EVENT_ITEM { #Handin: 4x Rat Whiskers
if(plugin::check_handin(\%itemcount, 13071 => 4)){ #End of Exterminate the Vermin (Scripted By: Fatty Beerbelly)
$client->Message(14,"I am very impressed, $name! A few more cleaners like yourself and we could have a rodent-free Qeynos in no time!");
quest::faction(135,10); # +Guards of Qeynos
quest::faction(9,10); # +Antonius Bayle
quest::faction(217,10); # +Merchants of Qeynos
quest::faction(53,-10); # -Corrupt Qeynos Guards
quest::faction(33,-10); # -Circle of Unseen Hands
quest::ding();
quest::exp(5);
quest::givecash(1,1,1,1);}
elsif(plugin::check_handin(\%itemcount, 13250 => 1)){ #Spider leg for Beetle leg
$client->Message(14,"Here is the spider leg for you, $name. Great work.");
quest::summonitem("13417");
}
else {
plugin::return_items(\%itemcount);
$client->Message(14,"I don't need these, it is NOT what i asked for. Here $name take them back.");
 }
}
