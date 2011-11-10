#zone: gunthak NPC: Cadale_Brohat (224209)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::emote("smiles widely at you. 'Welcome. You are brave to venture to Broken Skull Rock. Don't mind the others. Everyone is a bit touchy around here. If you are interested in dyes, feel free to peruse what I have to offer. Playing with them has given me hours of entertainment! Just be careful on this rock, and watch your back. Oh, before I forget, I'm looking for someone to help me with some [tasks] that I need to get done. All my time with the dyes has kept me from some of the more important things I need to take care of.'");
  quest::emote("Gets closer and whispers,'Or perhaps you might be interested in hiring some [help]?");
 }
elsif($text=~/help/i){
  quest::emote("chuckles, 'I have some mercenary friends interested in making some plat, they've asked me to handle their [pay]");
}
elsif(($text=~/pay/i)&&($class eq 'Warrior')){
  quest::emote("Whispers, 'Not so loud! I'm moonlighting here -  50 plat will get you help tell you leave this world'");
}
elsif(($text=~/pay/i)&&($class eq 'Paladin')){
  quest::emote("Whispers, 'Not so loud! I'm moonlighting here -  50 plat will get you help tell you leave this world'");
}
elsif(($text=~/pay/i)&&($class eq 'Shadowknight')){
  quest::emote("Whispers, 'Not so loud! I'm moonlighting here -  50 plat will get you help tell you leave this world'");
}
elsif(($text=~/pay/i)&&($class eq 'Ranger')){
  quest::emote("Whispers, 'Not so loud! I'm moonlighting here -  50 plat will get you help tell you leave this world'");
}
elsif(($text=~/pay/i)&&($class eq 'Monk')){
  quest::emote("Whispers, 'Not so loud! I'm moonlighting here -  50 plat will get you help tell you leave this world'");
}
elsif(($text=~/pay/i)&&($class eq 'Bard')){
  quest::emote("Whispers, 'Not so loud! I'm moonlighting here -  50 plat will get you help tell you leave this world'");
}
elsif(($text=~/pay/i)&&($class eq 'Rogue')){
  quest::emote("Whispers, 'Not so loud! I'm moonlighting here -  50 plat will get you help tell you leave this world'");
}
elsif(($text=~/pay/i)&&($class eq 'Berserker')){
  quest::emote("Whispers, 'Not so loud! I'm moonlighting here -  50 plat will get you help tell you leave this world'");
}
elsif($text=~/pay/i){
  quest::says("Sorry, this offer is only for melee-types");
 }
}

sub EVENT_ITEM{
  if ($platinum<=49){
    quest::say("Thank you for your donation $name, it wasn't enough though ...");
}
  elsif (($platinum>=50)&&($sandee==0)){
    quest::emote("summons a mercenary to your side");
    quest::spawn2(224236,1,0,-242.0,1521.1,4.1,108.4);
    quest::say("Here she is, be careful not to wander too far away from her, else she comes back to me");
    quest::delglobal("sandy");
    quest::setglobal("sandy",2,3,"F");
    $sandy=undef;
    $sandee=1;
    quest::delglobal("$name");
    quest::setglobal("$name",3,3,"F");
}
   elsif ($sandy==2){
    quest::say("Sorry, all mercenarys are in use.");
}
   elsif (${$name}==3){
    quest::say("You can only have one at a time.");
}
  elsif (($platinum>=50)&&($sandy==3)){
    quest::emote("summons a mercenary to your side");
    quest::spawn2(224236,1,0,-242.0,1521.1,4.1,108.4);
    quest::say("Here she is, be careful not to wander too far away from her, else she comes back to me");
    quest::delglobal("sandy");
    quest::setglobal("sandy",2,3,"F");
    $sandy=undef;
    quest::delglobal("$name");
    quest::setglobal("$name",3,3,"F");
}else{
    quest::say("Oops! I missed a possibilty!");
 }
}
 # quest::say("Welcome. You are brave to venture to Broken Skull Rock. Don't mind the others. Everyone is a bit touchy around here. If you are interested in dyes, feel free to peruse what I have to offer. Playing with them has given me hours of entertainment! Just be careful on this rock, and watch your back. Oh, before I forget, I'm looking for someone to help me with some [tasks] that I need to get done. All my time with the dyes has kept me from some of the more important things I need to take care of.");