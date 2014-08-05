sub EVENT_SAY {  
  my $spells = quest::saylink("spells", 1);
   if ($text=~/Hail/i){
    quest::emote(' wipes the sweat from his forehead and spits some flarefire seeds on the ground near your feet.');
    quest::say("Whew!! Good to be back and safe at the Cabilis Gate. The troopers will protect us.");
  }
   if ($text=~/diagram/i){
    quest::emote(' spits out some flarefire seeds');
    quest::say("'Great!! Sent to retrieve the Chalp diagram. I will give them to you, but I want you to do me a little favor first. I want you to retrieve some $spells I lost. They are incorrectly scribed and useless, but I yearn for their return nonetheless.");
   }
   if ($text=~/spells/i){
	quest::emote(' spits some flarefire seeds on you.');
	quest::say("Oops!! Sorry. Yeah!! You go to Chalp and get two incorrectly scribed spells which they grabbed from me. The third one, I threw in a river crossing by Chalp. It was in a bottle and probably drifted way down the river. Bring me all three and also a shovel and I will make it worth your while.");
	}
   if ($text=~/flarefire/i){
    quest::emote(' spits some flarefire seeds on your face!'); 
    quest::say("What? Interested in flarefire seeds? There you go. Ha!!");
 }
}
sub EVENT_ITEM { 
   if (plugin::check_handin(\%itemcount, 6026 =>1, 12494 =>1, 12493 =>1, 12492 =>1 )) {
    quest::emote(' accidently swallows a mouthful of flarefire seeds');
	quest::say("'ACCCKK!!  I can't believe you did it!! Here is the Chalp diagram.");
	quest::summonitem(12496);
	quest::faction(193, 10);
	quest::faction(62,10);
	quest::depop();
 }
}