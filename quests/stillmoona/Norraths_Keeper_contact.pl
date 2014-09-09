sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote(' looks around as if eyes are watching her every move.');
    quest::say("Are you here to finish me off? Please let me die in peace.");
	}
 }
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 36214 => 1)) {  
quest::say("Oh! You got the plans, Great work $name. I'll would take these plans back to the camp so they could begin to work on deciphering them but I am injured. Your job here is not yet complete. Still lurking about withing these walls is the force from Lanys' camp that attacked and crippled me. As we shouldn't let Layns know that we have plans, we need you to silence this force to cover up what you've accomplished here today.");
quest::say("Here, take the plans back, I am afraid you will must deliver the plans yourself.");
quest::summonitem(36214);
quest::spawn2(338219,0,0,-312.6,974.5,42.7,86);
quest::spawn2(338219,0,0,-312.6,936.6,42.7,29);
quest::depop();
   }
 }  