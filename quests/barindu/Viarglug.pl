#BeginFile: barindu\Viarglug.pl
#Quest file for Barindu - Viarglug (Passive): Necromancer Epic 1.5 (Soulwhisper)

sub EVENT_SAY {
  if(($text=~/hail/i)) {
    quest::say("I wonder how much I could get for the tongue of a blithering fool..leave before I decide to find out for myself.");
    quest::spawn2(283156,0,0,-49.1,-306.2,-124.1,249.6); #Viarglug (Active)
    quest::spawn2(283164,0,0,-60,-492.6,-124.1,250.8);
    quest::depop();
  } 
} 


#EndFile: barindu\Viarglug.pl (283158)