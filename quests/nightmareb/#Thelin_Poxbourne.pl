sub EVENT_SAY{
   if($text=~/hail/i){
   quest::summonitem(9259);
   quest::say("Please destroy her for all that have had to endure her hideous visions.");
   quest::settimer("snooze",15);
   $npc->SetAppearance(3);#sleeping
   quest::emote(' closes his eyes and is swept away from his nightmare. The land of pure thought begins to vanish from around you.');
   quest::stoptimer("snooze");
   quest::delglobal("Tmaze");
   quest::setglobal("Tthule", 1, 5, "F"); #sets global so you have access to final hedge event Terris Thule fight
   quest::movepc(203,-1170.8,667.2,-847.8);
   quest::depop();
   }
 }
sub EVENT_TIMER{
 if($timer eq "snooze"){
   quest::stoptimer("snooze");
   quest::movepc(203,-1170.8,667.2,-847.8);
   quest::depop();
   }
 }
