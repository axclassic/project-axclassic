##Third and Final Overlord Mata Muram 317138##
sub EVENT_SPAWN {
  my $curhp = $npc->GetHP();
  my $HealPoints = -630000;
  $npc->SetHP($curhp + $HealPoints);
  quest::shout("Now!, let us finish this. Come close I have something for you!");
  }
sub EVENT_DEATH {
   quest::spawn2(317128,0,0,425.5,4911.8,275.5,28.9);	
   quest::signalwith(317128,999,0);
   quest::ze(14,"The walls of Anguish tremble, you can feel the world shaking your bones. For a brief moment you think you see a smile flash across Mata Muram's face, and as the last breath escapes his lungs you hear a faint voice,");
   quest::ze(15,"There are worlds other than these...");
 }
 