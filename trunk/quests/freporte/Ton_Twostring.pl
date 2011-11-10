#############
#Quest Name:Going Postal (Rivervale)
#Author:Shaznito
#NPCs Involved:Silna Songsmith, Felisity Starbright, Ton Twostring, Idia, Lislia Goldtune, Eve_Marsinger
#Items Involved:Bardic Letter (Freeport) 
#A pouch of Mail (Highpass) 
#A Pouch of Mail (Qeynos)
#A Pouch of Mail (Freeport)
#################

sub EVENT_SAY { 

if($text=~/Hail/i){
quest::say("Hail, $name - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");

}

if($text=~/mail/i){
quest::say("The League of Antonican Bards has a courier system made up of travelers, adventurers and [agents].  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?");

}

if($text=~/agents/i){
quest::say("Silna Songsmith, Travis Two-Tone, Drizda Tunesinger and Dark Deathsinger all report to Felisity Starbright.");

}

if($text=~/interested/i){
quest::say("I have messages that need to go to Highpass and to Kelethin.  Will you deliver mail to [Kelethin] or [Highpass] for me?");

}

if($text=~/kelethin/i){
quest::summonitem("18167"); #  A pouch of Mail (Kelethin)
quest::say("Take this pouch to Idia in Kelethin.  You can find her at the bard guild hall.  I am sure she will compensate you for your troubles.");

}

if($text=~/highpass/i){
quest::summonitem("18152"); # A pouch of Mail (Highpass) 
quest::say("Take this pouch to Lislia Goldtune in Highpass.  You can find her at the entrance to HighKeep.  I am sure she will compensate you for your troubles.");
 }
}

sub EVENT_ITEM {
# Hand in A pouch of Mail (Highpass) 
 if(plugin::check_handin(\%itemcount, 18166 => 1)){
 quest::say("Mail from the front - thank you very much!  Please take this gold for your troubles.  If you are interested in more work, just ask Ton Twostring.");
 quest::faction(192,20);
 quest::faction(184,20); 
 quest::faction(135,20);  
 quest::faction(273,-25); 
 quest::faction(207,-25); 
  quest::ding(); quest::exp(115);
 quest::givecash(0,0,9,0);

 } else { 
  #do all other handins first with plugin, then let it do disciplines
  quest::say("I have no need for this item $name, you can have it back.");
  plugin::return_items(\%itemcount);
 }
}

#END of FILE Zone:East Freeport  ID:8101 -- Ton_Twostring 
