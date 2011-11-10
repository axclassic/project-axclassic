######################################
## NPC: Exterminator_Windloag ##
## Zone: Quenos2 ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
if($text=~/Hail/i){
#Start of Exterminate the Vermin Quest (Scripted By: Fatty Beerbelly)
$client->Message(14,"I really can't believe it, $name. I have seen Qeynos in bad shape but this is unbelievable! The rodents have practically taken over our city. If you see some of them running around, keep the rat whiskers, and I will reward you for every four you bring me. I can also trade your beetle legs for spider legs if you ever may need them. Just give me one at a time. Did you see how Fippy Darkpaw tried to evade Qeynos on his own HAHAHA the stupid fool, it worries me though, it could be some form of deversion for a real attack. Please bring me the Blackburrow battle plans so we know what they are up to, those darn dog faces. If you do I would part with this Orc ribcage I picked up from East Commonlands.");
}
}

sub EVENT_ITEM {
#Handin: 4x Rat Whiskers
if(plugin::check_handin(\%itemcount, 13071 => 4)){ #End of Exterminate the Vermin (Scripted By: Fatty Beerbelly)
$client->Message(14,"Here is something for you, $name. I certainly appreciate your help with our pest problem here. Great work.");
quest::faction(9,10); # +Antonius Bayle
quest::faction(135,10); # +Guards of Qeynos
quest::faction(217,10); # +Merchants of Qeynos
quest::faction(33,-10); # -Circle of Unseen Hands
quest::faction(53,-10); # -Corrupt Qeynos Guards
quest::ding(); quest::exp(5);
quest::givecash(1,1,1,1);
}

elsif(plugin::check_handin(\%itemcount, 13250 => 1)){ #Spider leg for Beetle leg
$client->Message(14,"Here is the spider leg for you, $name. Great work.");
quest::summonitem("13417");
}

elsif(plugin::check_handin(\%itemcount, 27416 => 1)){ #Blackburrow Battle plans for Orc Ribcage
$client->Message(14,"Here is the Orc Ribcage for you, $name. It hurts me to part with it but a deal is a deal..... I guess. Leave quick before I take it back!");
quest::summonitem("19551");
}
else {
plugin::return_items(\%itemcount);
$client->Message(14,"I don't need these, it is NOT what i asked for. Here $name take them back.");
}
}