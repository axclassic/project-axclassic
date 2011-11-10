#############
#NPC: Guard_Weleth
#Quest Name: The Crate (good)
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Nesiff_ Tallaherd
#Items Involved: Crate of Defective Arrows ID:13925, Slip of Parchment ID:18824
#zone: qeynos2

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail, $name. My name is Weleth Nagoh. In addition to my patrol, I am in charge of keeping the guardhouse stocked with supplies. I must get back to my duties.");
  }
  if($text=~/what crate/i) {
    quest::say("Oh, we just received a shipment of arrows from [Nesiff] in South Qeynos. The arrows in this box are missing their fletchings and I can't leave my patrol to take them back.");
  }
  if(($text=~/who Nesiff/i)||($text=~/who is Nesiff/i)) {
    quest::say("Nesiff Tallaherd owns the wooden weapons shop in Merchant's Square in South Qeynos.");
  }
  if($text=~/take the crate/i) {
    quest::say("Oh, thank you! Here is the crate. Make sure [Nesiff] sends me back a new invoice. [Lieutenant Dagarok] would have my head id he found out this happened again!");
	# Crate of Defective Arrows ID:13925
	quest::summonitem(13925);
  }
  if(($text=~/who Lieutenant Dagarok/i)||($text=~/who is Lieutenant Dagarok/i)) {
    quest::say("Lieutenant Dagarok is the officer in charge of all of North Qyenos. He is difficult to get along with and I [do not trust] him.");
  }
  if($text=~/trust him/i) {
    quest::say("Late one night not long ago, after I was off duty, I witnessed Lieutenant Dagarok and a few others slay someone they claimed was a suspected necromancer. I had met their victim the day before and I know he was an innocent paladin from Freeport. What really shocked me was that Dagarok was bathed in an evil green glow as their victim crumpled to the ground. I don't know who to trust any more!");
  }
}

sub EVENT_ITEM {
  # Slip of Parchment ID:18824
  if(plugin::check_handin(\%itemcount, 18824 => 1)) {
    quest::say("Thank you so much for the favor. Please be careful here in Qeynos. I have come to suspect that even some of my fellow guards are not to be trusted. - Lieutenant Dagarok, for one");
	quest::faction(135,10); #guards of qeynos
    quest::faction(9,10);   #antonius bayle
	quest::faction(53,-30); #corrupt qeynos guards
	quest::faction(33,-30); #circle of unseen hands
    quest::faction(218,10); #merchants of qeynos
	quest::ding(); quest::exp(250);
    quest::givecash(6,0,0,0);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_WAYPOINT {
  # Get location and heading of NPC to trigger text when entering room only.
  my $x = int($npc->GetX());
  my $h = int($npc->GetHeading());
  if(($wp == 15) || ($wp == 17)) {
	if(($x == 170) && ($h < 90)) {
	  # Animation: Disgusted
	  quest::doanim(28);
      quest::say("Argh. Not Again. This whole crate needs to be returned!");
    }
  }
}

# EOF zone: qeynos2 ID: 2079 NPC: Guard_Weleth


