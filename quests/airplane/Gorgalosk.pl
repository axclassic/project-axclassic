sub EVENT_SAY {
   if($text=~/hail/i) {
      quest::say("Greetings, $name. This is my domain and I hope you have a peaceful stay. That is, unless the [lunatic sent you].");
   }
   if($text=~/lunatic sent me/i) {
      quest::say("Oh, I see. I suppose you [want these cursed markers] that lunatic made me hold?");
   }
   if($text=~/cursed markers/i) {
      quest::say("I am afraid that I can not just give them away. The lunatic had them cursed. They make me do [strange things]");
   }
   if($text=~/strange things/i) {
      quest::say("Like ATTACK you!");
      my $annoyer = $client->GetID();
      quest::signalwith(71019,$annoyer,0);
      quest::signalwith(71022,$annoyer,0);
      quest::sleep(2000);
      quest::attack($name);
   }
}

sub EVENT_DEATH {
   $x = $npc->GetX();
   $y = $npc->GetY();
   $z = $npc->GetZ();
   $sirran= undef;   
   quest::setglobal("sirran",3,3,"M10");
   quest::spawn(71058, 0, 0, $x-10, $y, $z+10);
}

