## Angelox
## Enchant Bars Script


sub EVENT_SAY{
  if($text=~/hail/i) {
    quest::say("Hello $name, I have aquired the abity to enchant bars, I can enchant [silver], [electrum], [gold] and [platinum] bars ");
    quest::say("I can also cast Thicken Mana and create a [Vial] of Viscous Mana mana for you");
  }
  if($text=~/silver/i) {
    quest::say("You must be level 7 for this, Give me a silver bar and my fee is 5pp.");
  }
  elsif($text=~/electrum/i) {
    quest::say("You must be level 14 for this, Give me a electrum bar and my fee is 10pp.");
  }
  elsif($text=~/gold/i) {
    quest::say("You must be level 24 for this, Give me a gold bar and the fee is 15pp.");
  }
  elsif($text=~/platinum/i) {
    quest::say("You must be level 32 for this, Give me a platinum bar and the fee is 20pp.");
  }
  elsif($text=~/Vial/i) {
    quest::say("I need a perl, a poison vial, and the fee is 10pp.");
  }
}

sub EVENT_ITEM{
  if(($itemcount{16500} == 1) && ($platinum >= 5)){
	if ($ulevel < 7){
          quest::say("You don't have the needed level.");
	  plugin::return_items(\%itemcount);
	    if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
	      quest::givecash($copper, $silver, $gold, $platinum);
	   }
	 return; 
	}
    quest::say("Casting Enchant Silver...");
    $npc->CastSpell(667,$userid);
    quest::settimer("chant1",5);
    quest::summonitem(16504);
  }
  elsif(($itemcount{16501} == 1) && ($platinum >= 10)){
	if ($ulevel < 14){
          quest::say("You don't have the needed level.");
	  plugin::return_items(\%itemcount);
	    if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
	      quest::givecash($copper, $silver, $gold, $platinum);
	   }
	 return; 
	}
    quest::say("Casting Enchant Electrum...");
    $npc->CastSpell(668,$userid);
    quest::settimer("chant2",5);
    quest::summonitem(16505);
  }
  elsif(($itemcount{16502} == 1) && ($platinum >= 15)){
	if ($ulevel < 24){
          quest::say("You don't have the needed level.");
	  plugin::return_items(\%itemcount);
	    if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
	      quest::givecash($copper, $silver, $gold, $platinum);
	   }
	 return; 
	}
    quest::say("Casting Enchant Gold...");
    $npc->CastSpell(669,$userid);
    quest::settimer("chant3",5);
    quest::summonitem(16506);
  }
  elsif(($itemcount{16503} == 1) && ($platinum >= 20)){
	if ($ulevel < 32){
          quest::say("You don't have the needed level.");
	  plugin::return_items(\%itemcount);
	    if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
	      quest::givecash($copper, $silver, $gold, $platinum);
	   }
	 return; 
	}
    quest::say("Casting Enchant Platinum...");
    $npc->CastSpell(670,$userid);
    quest::settimer("chant4",5);
    quest::summonitem(16507);
  }
  elsif((($itemcount{10024} == 1) | ($itemcount{54074} == 1)) && ($itemcount{16965} == 1) && ($platinum >= 10)){
    quest::say("Casting Thicken Mana...");
    $npc->CastSpell(390,$userid);
    quest::settimer("chant5",5);
    quest::summonitem(10250);
  }
  else {
    quest::say("This is not what I asked for.");
    plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);
  }
 }
}

sub EVENT_TIMER{
    if ($timer eq "chant1"){
        quest::say("There ya go and thank you!");
        quest::stoptimer("chant1");
   }
    elsif ($timer eq "chant2"){
        quest::stoptimer("chant2");
        quest::say("There ya go and thank you!");
  }
    elsif ($timer eq "chant3"){
        quest::stoptimer("chant3");
        quest::say("There ya go and thank you!");
  }
    elsif ($timer eq "chant4"){
        quest::stoptimer("chant4");
        quest::say("There ya go and thank you!");
  }
    elsif ($timer eq "chant5"){
	#quest::selfcast("390");
        quest::say("There ya go and thank you!");
        quest::stoptimer("chant5");
  }
}
