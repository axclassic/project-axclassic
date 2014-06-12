#############
#NPC: Hanns_Krieghor
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Stanos Herkanor
#Items Involved: 
#zone: qeynos2

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("My name is Hanns..  Do as I say. and we shall get along just fine.");
  }
  if($text=~/stanos/i){
    quest::say("Stanos Herkanor? (he roars in frustration) That bastard should be long dead by now. If you see him, you hightail it back and let me know at once. Do I make myself clear, $name? Do not speak to him, do not attack him, just return here and inform me. And that is ALL you need to know about Stanos.");
  }
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 18708 => 1)){
	quest::say("So you wish to jion our guild? We are members of the Circle of Unseen hands and as such, you will not be welcomed in many places. Take this tunic for it may just save your worthless life. Stealth is you best defense and offense. Move quietly and quickly."); #text made up
	quest::summonitem(58760); #wisperwalkers apprentice tunic
	quest::ding();
	quest::faction(33, 10);  #Cricle of Unseen Hands
    quest::faction(53, 10);  #Corrupt Qeynos Guards
    quest::faction(164, 10);  #Kane Bayle
    quest::faction(135, -30); #Guards of Qeynos
	quest::faction(217, -30); #Merchants of Qeynos
	quest::exp(1000);
	}
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
   if ($signal == 1) {
     quest::say("Finally, the rat comes out of his hole! Send some men, no no, go yourself, and track him down. Then kill him. I don't care who sees you, or who gets in your way. Finish the job. And bring me whatever you find on his carcass. I'm sure he took some valuables from us when he escaped. And don't worry about Malka, she will keep until you finish Stanos, then she is yours. Shame to waste such talent, but you don't steal from the Circle and live.");
     ## Angelox This quest:signal gives error in logs:
     ## Script error: qst2074::EVENT_SIGNAL - Perl runtime error: 
     ## Usage: signal(npc_id[,wait_ms]) at quests/qeynos2/Hanns_Krieghor.pl line 28.
     ## quest::signal(2033, 1, 2); #signal to Renux Herkanor
   }
 }
#END of FILE Zone:qeynos2  ID:2074 -- Hanns_Krieghor

