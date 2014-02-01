# Event zone to home town
# Zone: draniksscar
# AngeloX, Site3op

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say('Should you wish to return from whence you came, tell me you wish to [go home] and I will send you.  I am also able to aid you for your wizard and druid mercenaries with the ability to [find their way] further into Discord.');}
  elsif (($text=~/go home/i)&&($race eq 'Wood Elf')){
  quest::movepc(54,-197,27,-0.7);}
  elsif (($text=~/go home/i)&&($race eq 'Human')){
  quest::movepc(9,-60.9,-61.5,-24.9);}
  elsif (($text=~/go home/i)&&($race eq 'Erudite')){
  quest::movepc(24,-309.8,109.6,23.1);}
  elsif (($text=~/go home/i)&&($race eq 'High Elf')){
  quest::movepc(61,26.3,14.9,3.1);}
  elsif (($text=~/go home/i)&&($race eq 'Barbarian')){
  quest::movepc(29,12.2,-32.9,3.1);}
  elsif (($text=~/go home/i)&&($race eq 'Dark Elf')){
  quest::movepc(25,-965.3,2434.5,5.6);}
  elsif (($text=~/go home/i)&&($race eq 'Half Elf')){
  quest::movepc(9,-60.9,-61.5,-24.9);}
  elsif (($text=~/go home/i)&&($race eq 'Dwarf')){
  quest::movepc(68,-214.5,2940.1,0.1);}
  elsif (($text=~/go home/i)&&($race eq 'Troll')){
  quest::movepc(52,1.1,14.5,3.1);}
  elsif (($text=~/go home/i)&&($race eq 'Ogre')){
  quest::movepc(49,520.1,235.4,59.1);}
  elsif (($text=~/go home/i)&&($race eq 'Halfling')){
  quest::movepc(19,-98.4,11.5,3.1);}
  elsif (($text=~/go home/i)&&($race eq 'Gnome')){
  quest::movepc(55,7.6,489.0,-24.9);}
  elsif (($text=~/go home/i)&&($race eq 'Iksar')){
  quest::movepc(106,-415.7,1276.6,3.1);}
  elsif (($text=~/go home/i)&&($race eq 'Froglok')){
  quest::movepc(1,198.4,14.6,3.1);}
  elsif (($text=~/go home/i)&&($race eq 'Vah Shir')){
  quest::movepc(155,105.6,-850.8,-190.4);}
  elsif($text=~/find their way/i){
    quest::say('If you bring me the right materials -- three samples of pure discordant blood from a dark creature and a rare enchanted scroll, I can help to create teleportation spells.');}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 77767 => 3, 77768 => 1)){
    quest::emote('takes the sickly blood and spreads it across the enchanted scroll. It blends and swims horribly over it. When it settles, the priest hands it to you.');
    quest::say('You may now travel further into Discord, true power awaits!');
    quest::summonitem("77657");
    quest::summonitem("77658");
    quest::summonitem("77654");
    quest::summonitem("77656");
    quest::summonitem("77655");
  }else{
    quest::say("I can't use this.");
    plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);
     }
   }
}

#Original code removed so you can use for bot quest;
#  if($class eq 'Druid'){quest::summonitem("77657");}
#  elsif($class eq 'Druid'){quest::summonitem("77658");}
#  elsif($class eq 'Wizard'){quest::summonitem("77654");}
#  elsif($class eq 'Wizard'){quest::summonitem("77656");}
#  elsif($class eq 'Wizard'){quest::summonitem("77655");}

