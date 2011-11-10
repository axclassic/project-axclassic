sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Mmmph!!  Who you?  Oh. you $name.  You supposed to be promising Craknek.  Me need you.  There bad things in swamp.  You want [help Crakneks] or you [want Guntrik bash your face]!!?");
}
if($text=~/help crakneks/i){
    if ($faction <5) {
    quest::say("Go to swamps. Find noble hunters of humans and elves. All have house crests. Return to me, and I give you things.");
    quest::emote("thinks hard for an ogre and remembers.");
    quest::say("Oh, wait. If you find special item that says where hunters sleep, bring it to me. And if you find meat, give it to Clurg's cook. She makes good stew and gives many shinies for meat.");
    }
    else {quest::say("Crakneks warriors!!  They be far back.  Through last caves.  They smash and bash.  They no like Greenbloods.  Bouncers keep thems from bashing.");
}
}
if($text=~/i want gruntrik to bash my face/i){
quest::say("Me strongest. You weak. Craknek best always.");
quest::attack($name);
 }
}
sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 18787 => 1)) {
	quest::say("Ahh..  good..  good..  here. take..  now you Craknek! You bash good. Bash lizards. Bash froggies. Bash mushrooms. Remember. you no help Greenbloods. Crakneks stronger than Greenbloods.");
	quest::ding();
	quest::exp(1000);
  quest::faction(46,10); # Clurg
  quest::faction(57,101); # Craknek Warriors
  quest::faction(128,-70); # Greenblood Knights
	quest::summonitem(13525); #Mud Stained Skin Tunic
 }
   elsif (plugin::check_handin(\%itemcount, 13361 => 1)) { 
    quest::say("One less torulbe. Hunhuh!! You do good work. Keep up.");
    quest::say("Remember to bring any special things to Guntrik. Here junk for good work. Go away now.");
    quest::ding();
    quest::exp(23450);
    quest::faction(46,10); # Clurg
    quest::faction(57,50); # Craknek Warriors
    quest::faction(128,-50); # Greenblood Knights
    quest::summonitem(quest::ChooseRandom(5027,5028,5029,5030,5031,5032,5033,5034,5035,5036,4225,4226,4227,4228,4229,4232,4233,4234,4235,4236,13355));
    }
  
 else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:oggok  ID:49043 -- Guntrik 

