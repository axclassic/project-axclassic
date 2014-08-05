#Arch Duke Xog is a shadow knight guildmaster. We turn our newbie note in to him, and he also gives us the seventh Greenmist quest once we've grown up and gotten that far in the quest series.

sub EVENT_SAY {
my $Greenmist = quest::saylink("Greenmist", 1);
my $Argest = quest::saylink("Argest", 1);
my $ancient = quest::saylink("ancient", 1);
my $where = quest::saylink("where", 1);
 if($text=~/hail/i){
 quest::emote('As your reptilian eyes adjust to the darkness of the room, an imposing Iksar turns towards you, addressing you with a sharp hiss');
  quest::say("I am Arch Duke Xog. The time has come young one. You have chosen the path of the Shadowknight. Open your inventory and read the note within. Once you are ready to begin your training, hand the note to me and we will continue.");
  }
 if($text=~/Greenmist/i){ #Test of the Hero (Greenmist Quest 7/8)
  quest::emote("appears surprised at your words. 'You know of Greenmist? The Unholy Khukri of Rile? We once had knowledge of this weapon, but when our great cities were destroyed in 1056 A.G., so, too, were all the great libraries. We lost all records. An explorer named $Argest claimed to have found one library still intact. Pure babble.'");
  }
 if($text=~/Argest/i){ #Test of the Hero (Greenmist Quest 7/8)
  quest::say("Once a Lord of Pain, Argest is now a great explorer. No lizard has seen more of Kunark than he. He returned one season ago to tell tales of an $ancient library. He said that he believed that there he would find a tome which would reveal the location of the ancient crusader weapon, Greenmist.");
  }
 if($text=~/ancient/i){ #Test of the Hero (Greenmist Quest 7/8)
  quest::say("There are many ancient libraries yet to be discovered. Our once great cities have been decimated, if not by our foes, then by nature itself. Within the outlands are many ruins which have yet to reveal themselves. We look forward to the discovery of these ruins by such explorers as Lord Argest the Great. If only we knew $where he was...");
  }
 if($text=~/where/i){ #Test of the Hero (Greenmist Quest 7/8)
  quest::emote("becomes despondent at your question. 'Alas, our chance of locating Greenmist is lost as long as Argest remains missing. Reports have come in from the Legion's deep range patrols that he may be in the Frontier Mountain range. At least, that is where the patrol captain found Argest's walking staff. He might have been captured, killed or even digested!!'");
  }
}

sub EVENT_ITEM {
  if(($itemcount{18205} == 1)){ #Test of the Newbie (Greenmist Quest 0/8)
  quest::say("Welcome into our brotherhood. Know you that our way is the way of pain. Do as we say and you shall climb the rungs of knighthood. Listen well to the Lords of Pain within this temple and follow the words of the hierophants, for Cazic-Thule speaks to us through them. Take this khukri. It is the chosen weapon of the Crusaders and can deliver great pain unto our foes. Go now and learn our ways. Seek out Lord Gikzic.");
  quest::summonitem(5120);
  quest::ding();
  quest::exp(100);
  quest::faction(62,20);
  quest::faction(193,10);
 }
 elsif(($itemcount{18051} == 1) && ($itemcount{5126} == 1)){ #Test of the Hero (Greenmist Quest 7/8)
  quest::say("A legible tome of the scrolls of Vok Na Zov! What a find this is!! May the unholy curses of Cazic flow through you. Please accept the weapon of a Lord of Pain. To abandon it is to abandon our ways and earn yourself the hatred of our order.");
  quest::summonitem(5128);
  quest::givecash("0","0","0","4"); 
   quest::ding(); quest::exp(4000);
  
  quest::faction(62,20);
  quest::faction(193,10);
 }
 else{ 
 plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
 plugin::return_items(\%itemcount);
 }
}

#Submitted by Jim Mills