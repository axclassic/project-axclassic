#############
#NPC: Hanns_Krieghor
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Stanos Herkanor
#Items Involved: 
#zone: qeynos2

sub EVENT_SAY { 
my $Agnostic = quest::saylink("Agnostic", 1);
my $Bertoxxulous = quest::saylink("Bertoxxulous", 1);
my $Bristlebane = quest::saylink("Bristlebane", 1);
my $Erollisi_Marr = quest::saylink("Erollisi_Marr", 1);
my $Innoruuk = quest::saylink("Innoruuk", 1);
my $Karana = quest::saylink("Karana", 1);
my $Rodcet_Nife = quest::saylink("Rodcet_Nife", 1);
my $East_Freeport = quest::saylink("East_Freeport", 1);
my $North_Qeynos = quest::saylink("North_Qeynos", 1);
if (($text=~/Rogue/i) && ($ulevel == 1) && ($class eq "Rogue")) {
    quest::say("A Fine choice, the Way of the Rogue, but I have a few more questions for you. Which Deity did you choose? $Agnostic, $Bertoxxulous, $Bristlebane, $Erollisi_Marr, $Innoruuk, $Karana or $Rodcet_Nife?");
  }
  if (($text=~/Agnostic/i) && ($ulevel == 1) && ($class eq "Rogue")) {
    quest::say("Following the way of The Agnostic? A Good Choice, So you will not commit to the existence or non-existence of any Deity. This is your choice.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $East_Freeport or $North_Qeynos.");
	}
  if (($text=~/Bertoxxulous/i) && ($ulevel == 1) && ($class eq "Rogue")) {
    quest::say("Following the way of Bertoxxulous? A Good Choice, Followers of The Plaguebringer believe the only truth on Norrath is that everything dies. They view the decay of flesh as a thing of ultimate beauty .");
    quest::say("On your way then, I will send you to North Qeynos. Hand this note to Hanns Krieghor, He is your Guildmaster of the Rogues."); 
	quest::summonitem(119867);
	quest::movepc(2,287,82,-16);
  }
  if (($text=~/Bristlebane/i) && ($ulevel == 1) && ($class eq "Rogue")) {
    quest::say("Following the way of The Bristlebane? A Good Choice, Followers of The King of thieves believe in having fun at the expense of nearly all else.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $East_Freeport, $North_Qeynos or $Greater_Faydark.");
    }
  if (($text=~/Erollisi_Marr/i) && ($ulevel == 1) && ($class eq "Rogue")) {
    quest::say("Following the way of The Erollisi Marr? A Good Choice, Followers of The Queen of Love believe that love can conquer all, while not being naive about it.");
    quest::say("On your way then, I will send you to East Freeport. Hand this note to Elisi Nasin. She is your Guildmaster of the Rogues."); 
	quest::summonitem(18747);
	quest::movepc(10,-864,-321,-108.2);
  }
  if (($text=~/Innoruuk/i) && ($ulevel == 1) && ($class eq "Rogue")) {
    quest::say("Following the way of Innoruuk? A Good Choice, Followers of the Prince of hate believe hate is THE creative force of the universe.It isthe honest belief that if they hate strong enough they could destroy all of Norrath.");
    quest::say("On your way then, I will send you to East Freeport. Hand this note to Elisi Nasin. She is your Guildmaster of the Rogues."); 
	quest::summonitem(18745);
	quest::movepc(10,-864,-321,-108.2);
	}
  if (($text=~/Karana/i) && ($ulevel == 1) && ($class eq "Rogue")) {
    quest::say("Following the way of The Karana? A Good Choice, Followers of The Rainkeeper believe in the absolute power of storms.");
    quest::say("On your way then, I will send you to North Qeynos. Hand this note to Hanns Krieghor, He is your Guildmaster of the Rogues."); 
	quest::summonitem(119867);
	quest::movepc(2,287,82,-16);
  }
   if (($text=~/Rodcet_Nife/i) && ($ulevel == 1) && ($class eq "Rogue")) {
    quest::say("Following the way of The Rodcet Nife? A Good Choice, Followers of The Prime Healer take oath to fight disease and death until one or the other takes them.");
    quest::say("On your way then, I will send you to North Qeynos. Hand this note to Hanns Krieghor, He is your Guildmaster of the Rogues."); 
	quest::summonitem(119867);
	quest::movepc(2,287,82,-16);
  }
   if (($text=~/East_Freeport/i) && ($ulevel == 1) && ($class eq "Rogue")) {
    quest::say("On your way then, I will send you to East Freeport. Hand this note to Elisi Nasin, She is your Guildmaster of the Rogues."); 
	quest::summonitem(18745);
	quest::movepc(10,-869,-315,-108);
  }
  if (($text=~/North_Qeynos/i) && ($ulevel == 1) && ($class eq "Rogue")) {
    quest::say("On your way then, I will send you to North Qeynos. Hand this note to Hanns Krieghor, He is your Guildmaster of the Rogues."); 
	quest::summonitem(119867);
	quest::movepc(2,287,82,-16);
  }
  if($text=~/hail/i){
    quest::say("You [dare] to speak with a loyal member of the Scouts of Tunare?!! You are truly foolish!! Run away while you still can.");
    }
    if($text=~/dare/i){
    quest::say("So. you think you have what it takes to be a Scout of Tunare? Come back with 2 [gold] and 2 [rusty dagger]s and I'll make it worth your while.");
    }
    if($text=~/Gem of Tunare/i){
    quest::say("The bright green Gem of Tunare was discovered by the Scouts of Tunare in a trunk of a great tree. The lightning streaked down and split the tree in two and there was the gem , Tunare's gift to the people of Kelethin. It has no magical properties , but it represents the glory of Tunare. It appears as a small Emerald Shard. Alas , now it has been stolen by Faldor Hendrys and only his brother [Elmion Hendrys] could know of his whereabouts.");
    }
    if($text=~/Elmion/i){
    quest::say("Seek out the Feir'Dal, Elmion. He was last heard telling the local bar patrons that he was off to do some adventuring at the lake near the Estate. What that is, I do not know.");
    }
    
  if($text=~/Hail/i){
    quest::say("My name is Hanns..  Do as I say. and we shall get along just fine.");
  }
  if($text=~/stanos/i){
    quest::say("Stanos Herkanor? (he roars in frustration) That bastard should be long dead by now. If you see him, you hightail it back and let me know at once. Do I make myself clear, $name? Do not speak to him, do not attack him, just return here and inform me. And that is ALL you need to know about Stanos.");
  }
}

sub EVENT_ITEM {
my $Rogue = quest::saylink("Rogue", 1);
if (plugin::check_handin(\%itemcount, 18708 => 1) && $class eq "Rogue") { 
  quest::say("I am Hanns Krieghor of the Circle of the Unseen Hands. A few years ago, The Rathe server was created in order to bring back the feel of the orginal EQ zones. Many things have changed over the years and with those changes, some things could not be done anymore.");
    quest::say("You were sent to me because there is a problem with getting you to the correct city with the correct guild summons.");
	quest::say("Since you are talking to me I must assume you are a $Rogue?");
	}
elsif (plugin::check_handin(\%itemcount, 119867 => 1)){
	quest::say("So you wish to join our guild? We are members of the Circle of Unseen hands and as such, you will not be welcomed in many places. Take this tunic for it may just save your worthless life. Stealth is you best defense and offense. Move quietly and quickly."); #text made up
	quest::summonitem(58760);
	quest::ding();
	quest::faction(33, 10);
    quest::faction(53, 10);
    quest::faction(164, 10);
    quest::faction(135, -30);
	quest::faction(217, -30);
	quest::exp(1000);
	quest::rebind(2,287,82,-16);
	}
       else {
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
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

