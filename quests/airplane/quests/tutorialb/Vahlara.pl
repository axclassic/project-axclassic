#zone: tutorialb
#customised Angelox
sub EVENT_SAY{
  if ($text=~/hail/i){
    quest::say("Hail $name! Welcome to Gloomingdeep. Be careful with the Kobolds, they live further down the tunnels ...");
    quest::say("There are many [others] that have tried, and not have been so lucky as to return.");}
  elsif ($text=~/others/i){
    quest::say("The others did not have the [parts] I needed to craft them protective armor.");}
  elsif ($text=~/parts/i){
    quest::say("Ah well the parts depend on what type of armour you want. There is [plate] , [chain] , [leather] , and [cloth].");}
  elsif ($text=~/a helmet/i){
    quest::say("In order to make a plate helmet for you $name, I require a chunk of iron found within the Gloomingdeep mines.");}
  elsif ($text=~/plate bracers/i){
    quest::say("To make the plate bracers for you, you need to bring me a chunk of iron and a gloomingdeep cocoon silk.");}
  elsif ($text=~/plate gauntlets/i){
    quest::say("I would love to craft plate gauntlets for you $name. Please bring me a chunk of iron and two gloomindeep cocoon silks.");}
  elsif ($text=~/plate boots/i){
    quest::say("All travelers require the proper footwear.  I can craft a fine pair of plate boots for you elsif you bring me a chunk of iron and three gloomingdeep cocoon silks.");}
  elsif ($text=~/plate vambraces/i){
    quest::say("So you seek to protect your arms? $name, please return to me a chunk of iron, two gloomingdeep cocoon silks and a piece of rat fur.");}
  elsif ($text=~/plate greeves/i){
    quest::say("A good $class knows that some critters only need to reach your legs.  With a chunk of iron, two gloomingdeep cocoon silks, and a bat wing, I can help protect you.");}
  elsif ($text=~/plate breastplate/i){
    quest::say("Ah, the true status of a $class.  This will require a chunk of iron, two gloomingdeep cocoon silks and the venom sack from that vile spider queen to craft.  Good luck and return when you have what I need.");}
  elsif ($text=~/plate/i){
    quest::say("I can make the following plate armour, [a helmet], [plate bracers], [plate gauntlets], [plate boots], [plate vambraces], [plate greeves], and  a [plate breastplate].  These all require you show your status in battle and return components to me.");}
  elsif ($text=~/chain coif/i){
    quest::say("In order to make a chain coif for you $name, I require a chunk of bronze found within the Gloomingdeep mines.");}
  elsif ($text=~/chain bracers/i){
    quest::say("To make the chain bracers for you, you need to bring me a chunk of bronze and a gloomingdeep cocoon silk.");}
  elsif ($text=~/chain gauntlets/i){
    quest::say("I would love to craft chain gauntlets for you $name. Please bring me a chunk of bronze and two gloomindeep cocoon silks.");}
  elsif ($text=~/chain boots/i){
    quest::say("All travelers require the proper footwear.  I can craft a fine pair of chain boots for you elsif you bring me a chunk of bronze and three gloomingdeep cocoon silks.");}
  elsif ($text=~/chain sleeves/i){
    quest::say("So you seek to protect your arms? $name, please return to me a chunk of bronze, two gloomingdeep cocoon silks and a piece of rat fur.");}
  elsif ($text=~/chain leggings/i){
    quest::say("A good $class knows that some critters only need to reach your legs.  With a chunk of bronze, two gloomingdeep cocoon silks, and a bat wing, I can help protect you.");}
  elsif ($text=~/chain chestguard/i){
    quest::say("Ah, the true status of a $class.  This will require a chunk of bronze, two gloomingdeep cocoon silks and the venom sack from that vile spider queen to craft.  Good luck and return when you have what I need.");}
 elsif ($text=~/chain/i){
    quest::say("I can make the following chain armour, [chain coif], [chain bracers], [chain gauntlets], [chain boots], [chain sleeves], [chain leggings], and  a [chain chestguard].  These all require you show your status in battle and return components to me.");}
  elsif ($text=~/a cap/i){
    quest::say("In order to make a leather cap for you $name, I require a piece of rat fur found within the Gloomingdeep mines.");}
  elsif ($text=~/leather bracers/i){
    quest::say("To make the leather bracers for you, you need to bring me a piece of rat fur and a gloomingdeep cocoon silk.");}
  elsif ($text=~/leather gloves/i){
    quest::say("I would love to craft leather gloves for you $name. Please bring me a piece of rat fur and two gloomindeep cocoon silks.");}
  elsif ($text=~/leather boots/i){
    quest::say("All travelers require the proper footwear.  I can craft a fine pair of leather boots for you elsif you bring me a piece of rat fur and three gloomingdeep cocoon silks.");}
  elsif ($text=~/leather sleeves/i){
    quest::say("So you seek to protect your arms? $name, please return to me two pieces of rat fur, and two gloomingdeep cocoon silks.");}
  elsif ($text=~/leather leggings/i){
    quest::say("A good $class knows that some critters only need to reach your legs.  With a piece of rat fur, two gloomingdeep cocoon silks, and a bat wing, I can help protect you.");}
  elsif ($text=~/leather tunic/i){
    quest::say("Ah, the true status of a $class.  This will require a piece of rat fur, two gloomingdeep cocoon silks and the venom sack from that vile spider queen to craft.  Good luck and return when you have what I need.");}
  elsif ($text=~/leather/i){
  quest::say("I can make the following leather armour, [a cap], [leather bracers], [leather gloves], [leather boots], [leather sleeves], [leather leggings], and  a [leather tunic].  These all require you show your status in battle and return components to me.");}
  elsif ($text=~/a headband/i){
    quest::say("In order to make a headband for you $name, I require a gloomingdeep silk found within the Gloomingdeep mines.");}
  elsif ($text=~/cloth wristbands/i){
    quest::say("To make the cloth wristbands for you, you need to bring me a gloomingdeep silk and a gloomingdeep cocoon silk.");}
  elsif ($text=~/cloth gloves/i){
    quest::say("I would love to craft cloth gloves for you $name. Please bring me a gloomingdeep silk and two gloomindeep cocoon silks.");}
  elsif ($text=~/cloth slippers/i){
    quest::say("All travelers require the proper footwear.  I can craft a fine pair of cloth slippers for you elsif you bring me a gloomingdeep silk and three gloomingdeep cocoon silks.");}
  elsif ($text=~/cloth sleeves/i){
    quest::say("So you seek to protect your arms? $name, please return to me a gloomingdeep silk, two gloomingdeep cocoon silks, and a piece of rat fur.");}
  elsif ($text=~/cloth pantaloons/i){
    quest::say("A good $class knows that some critters only need to reach your legs.  With a gloomingdeep silk, two gloomingdeep cocoon silks, and a bat wing, I can help protect you.");}
  elsif ($text=~/cloth robe/i){
    quest::say("Ah, the true status of a $class.  This will require a gloomingdeep silk, two gloomingdeep cocoon silks and the venom sack from that vile spider queen to craft.  Good luck and return when you have what I need.");}
  elsif ($text=~/cloth/i){
  quest::say("I can make the following cloth armour, [a headband], [cloth wristbands], [cloth gloves], [cloth slippers], [cloth sleeves], [cloth pantaloons], and  a [cloth robe].  These all require you show your status in battle and return components to me.");}
}

sub EVENT_ITEM{
my $owner = $npc->GetOwnerID();
  if ($itemcount{59954} == 1 && $itemcount{86010} == 2 && $itemcount{13064} == 1){
    quest::say("You have proven most resourceful $name.  I present you these newly crafted vambraces.");
    quest::summonitem(82928);}
  elsif ($itemcount{59954} == 1 && $itemcount{86010} == 2 && $itemcount{13068} == 1){
    quest::say("Your hard work can only be met with these fine greeves. Wear them proudly.");
    quest::summonitem(82929);}
  elsif ($itemcount{59954} == 1 && $itemcount{86010} == 2 && $itemcount{14018} == 1){
    quest::say("Marvelous $name. You truly are a brave warrior. Only one such as you is worthy enough to wear this armor.");
    quest::summonitem(82930);}
  elsif ($itemcount{59954} == 1 && $itemcount{86010} == 2){
    quest::say("Many thanks for returning with these items. Please accept these guantlets as a token of my appreciation.");
    quest::summonitem(82925);}
  elsif ($itemcount{59954} == 1 && $itemcount{86010} == 3){
    quest::say("Many thanks for returning with these items. Please accept these boots as a token of my appreciation.");
    quest::summonitem(82926);}
  elsif ($itemcount{59954} == 1 && $itemcount{86010} == 1){
    quest::say("Thank you $name. Take this bracer as your payment.");
    quest::summonitem(82924);}
  elsif ($itemcount{59954} == 1){
    quest::say("Thank you so much. We appreciate your help with this, it really is noted. Take this helmet and good luck to you!");
    quest::summonitem(82927);}
  elsif ($itemcount{54229} == 1 && $itemcount{86010} == 2 && $itemcount{13064} == 1){
    quest::say("You have proven most resourceful $name.  I present you these newly crafted sleeves.");
    quest::summonitem(82935);}
  elsif ($itemcount{54229} == 1 && $itemcount{86010} == 2 && $itemcount{13068} == 1){
    quest::say("Your hard work can only be met with these fine leggings. Wear them proudly.");
    quest::summonitem(82936);}
  elsif ($itemcount{54229} == 1 && $itemcount{86010} == 2 && $itemcount{14018} == 1){
    quest::say("Marvelous $name. You truly are a brave warrior. Only one such as you is worthy enough to wear this armor.");
    quest::summonitem(82937);}
  elsif ($itemcount{54229} == 1 && $itemcount{86010} == 1){
    quest::say("Thank you $name. Take this bracer as your payment.");
    quest::summonitem(82931);}
  elsif ($itemcount{54229} == 1 && $itemcount{86010} == 2){
    quest::say("Many thanks for returning with these items. Please accept these guantlets as a token of my appreciation.");
    quest::summonitem(82932);}
  elsif ($itemcount{54229} == 1 && $itemcount{86010} == 3){
    quest::say("Many thanks for returning with these items. Please accept these boots as a token of my appreciation.");
    quest::summonitem(82933);}
  elsif ($itemcount{54229} == 1){
    quest::say("Thank you so much. We appreciate your help with this, it really is noted. Take this coif and good luck to you!");
    quest::summonitem(82934);}
  elsif ($itemcount{13064} == 1 && $itemcount{86010} == 2 && $itemcount{13068} == 1){
    quest::say("Your hard work can only be met with these fine pants. Wear them proudly.");
    quest::summonitem(82943);}
  elsif ($itemcount{13064} == 1 && $itemcount{86010} == 2 && $itemcount{14018} == 1){
    quest::say("Marvelous $name. You truly are a brave warrior. Only one such as you is worthy enough to wear this armor.");
    quest::summonitem(82944);}
  elsif ($itemcount{13064} == 1 && $itemcount{86010} == 3){
    quest::say("Many thanks for returning with these items. Please accept these boots as a token of my appreciation.");
    quest::summonitem(82940);}
  elsif ($itemcount{13064} == 2 && $itemcount{86010} == 2){
    quest::say("You have proven most resourceful $name.  I present you these newly crafted sleeves.");
    quest::summonitem(82942);}
 elsif ($itemcount{54234} == 1 && $itemcount{13064} == 1 && $itemcount{86010} == 2){
    quest::say("You have proven most resourceful $name.  I present you these newly crafted sleeves.");
    quest::summonitem(82949);}
  elsif ($itemcount{13064} == 1 && $itemcount{86010} == 2){
    quest::say("Many thanks for returning with these items. Please accept these gloves as a token of my appreciation.");
    quest::summonitem(82939);}
  elsif ($itemcount{13064} == 1 && $itemcount{86010} == 1){
    quest::say("Thank you $name. Take this bracer as your payment.");
    quest::summonitem(82938);}
  elsif ($itemcount{13064} == 1){
    quest::say("Thank you so much. We appreciate your help with this, it really is noted. Take this cap and good luck to you!");
    quest::summonitem(82941);}
 elsif ($itemcount{54234} == 1 && $itemcount{86010} == 2 && $itemcount{13068} == 1){
    quest::say("Your hard work can only be met with these fine pantaloons. Wear them proudly.");
    quest::summonitem(82950);}
  elsif ($itemcount{54234} == 1 && $itemcount{86010} == 2 && $itemcount{14018} == 1){
    quest::say("Marvelous $name. You truly are a brave warrior. Only one such as you is worthy enough to wear this armor.");
    quest::summonitem(82951);}
  elsif ($itemcount{54234} == 1 && $itemcount{86010} == 3){
    quest::say("Many thanks for returning with these items. Please accept these slippers as a token of my appreciation.");
    quest::summonitem(82947);}
  elsif ($itemcount{54234} == 1 && $itemcount{86010} == 2){
    quest::say("Many thanks for returning with these items. Please accept these gloves as a token of my appreciation.");
    quest::summonitem(82946);}
  elsif ($itemcount{54234} == 1 && $itemcount{86010} == 1){
    quest::say("Thank you $name. Take this wristband as your payment.");
    quest::summonitem(82945);}
  elsif ($itemcount{54234} == 1){
    quest::say("Thank you so much. We appreciate your help with this, it really is noted. Take this headband and good luck to you!");
    quest::summonitem(82948); }
   elsif ($owner > 0) {
   }else {
quest::say("Sorry, I can't use this.");
plugin::return_items(\%itemcount);
 }
}

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER
{
  my $random_result = int(rand(100));
  if($random_result<=20){
    quest::say("There are many [others] that have tried, and not have been so lucky as to return.");
    }elsif($random_result<=40){
    quest::say("The others did not have the [parts] I needed to craft them protective armor.");
    }elsif($random_result<=60){
    quest::say("Be careful with the Kobolds, they live further down the tunnels ...");
    }
  elsif (($amote==2) && ($random_result>=61)){
    quest::spawn2(189119,0,0,-126.0,-295.8,3.0,124.8);
    }
  elsif (($bmote==2) && ($random_result>=61)){
    quest::spawn2(189120,0,0,-385.2,-516.3,-39.3,135.1);
    }
}

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::say("The time has come for you to die!");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("It is unwise of you to try that!");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("How dare you attack me!");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("The spirits will condem you!");
    }elsif($combat_state == 1){
    quest::say("I shall bathe in your blood!");}
}

sub EVENT_DEATH{
 quest::emote("'s corpse drops to the ground.");
 }

