## Angelox
## Enchant Bars Script
sub EVENT_SAY{
  if($text=~/hail/i) {
    quest::say("Hello $name, I have some [tradeskills] that may be of use to you");
  }
  elsif($text=~/tradeskills/i) {
    quest::say("I can [enchant] bars, make [viscous] mana, and upgrade your [flow] stones.");
  }
  elsif($text=~/enchant/i) {
    quest::say("I can enchant [silver], [electrum], [gold] and [platinum] bars ");
  }
  elsif($text=~/viscous/i) {
    quest::say("I can cast Thicken Mana and create a [Vial] of Viscous Mana mana for you");
  }
  elsif($text=~/flow/i) {
    quest::say("I can upgrade your Bloodflow, Starflow, Boneflow, Fireflow, Waterflow, Mudflow, Skyflow, Voidflow, Emberflow, Stormflow, Mossflow, or Shadowflow stones to [radiant] quality. I would also be interested in any regular flow stones you have to [sell].");
  }
  elsif($text=~/radiant/i) {
    quest::say("Give me and the flow stone you wish to upgrade and 3000pp is my fee.");
  }
  elsif($text=~/sell/i) {
    quest::say("Give me just the flow stone you wish to sell (one at a time), and I will pay you 200pp for each.");
  }
  elsif($text=~/silver/i) {
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
## Bloodflow, Starflow, Boneflow, Fireflow, Waterflow, Mudflow, Skyflow, Voidflow, Emberflow, Stormflow, Mossflow, Shadowflow
## 72650       72651	72652	   72653    72654   	72655	72656	 72657	   72658	72659	 72660	   72661
## 72686       72687	72688	   72689    72690	72691   72692	 72693	   72694 	72695	 72696	   72697
##Flow stone upgrade
  elsif(($itemcount{72650} == 1) && ($platinum >= 3000)){
    quest::say("Thank you! Enjoy your new stone");
    quest::summonitem(72686);
  }
  elsif(($itemcount{72651} == 1) && ($platinum >= 3000)){
    quest::say("Thank you! Enjoy your new stone");
    quest::summonitem(72687);
  }
  elsif(($itemcount{72652} == 1) && ($platinum >= 3000)){
    quest::say("Thank you! Enjoy your new stone");
    quest::summonitem(72688);
  }
  elsif(($itemcount{72653} == 1) && ($platinum >= 3000)){
    quest::say("Thank you! Enjoy your new stone");
    quest::summonitem(72689);
  }
  elsif(($itemcount{72654} == 1) && ($platinum >= 3000)){
    quest::say("Thank you! Enjoy your new stone");
    quest::summonitem(72690);
  }
  elsif(($itemcount{72655} == 1) && ($platinum >= 3000)){
    quest::say("Thank you! Enjoy your new stone");
    quest::summonitem(72691);
  }
  elsif(($itemcount{72656} == 1) && ($platinum >= 3000)){
    quest::say("Thank you! Enjoy your new stone");
    quest::summonitem(72692);
  }
  elsif(($itemcount{72657} == 1) && ($platinum >= 3000)){
    quest::say("Thank you! Enjoy your new stone");
    quest::summonitem(72693);
  }
  elsif(($itemcount{72658} == 1) && ($platinum >= 3000)){
    quest::say("Thank you! Enjoy your new stone");
    quest::summonitem(72694);
  }
  elsif(($itemcount{72659} == 1) && ($platinum >= 3000)){
    quest::say("Thank you! Enjoy your new stone");
    quest::summonitem(72695);
  }
  elsif(($itemcount{72660} == 1) && ($platinum >= 3000)){
    quest::say("Thank you! Enjoy your new stone");
    quest::summonitem(72696);
  }
  elsif(($itemcount{72661} == 1) && ($platinum >= 3000)){
    quest::say("Thank you! Enjoy your new stone");
    quest::summonitem(72697);
  }
##cash for flows tones
  elsif($itemcount{72650} == 1){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($itemcount{72651} == 1){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($itemcount{72652} == 1){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($itemcount{72653} == 1){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($itemcount{72654} == 1){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($itemcount{72655} == 1){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($itemcount{72656} == 1){
    quest::say("Thank you!");
   quest::givecash(0, 0, 0, 200);
  }
  elsif($itemcount{72657} == 1){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($itemcount{72658} == 1){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($itemcount{72659} == 1){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($itemcount{72660} == 1){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($itemcount{72661} == 1){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
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
