##Third and Final Overlord Mata Muram 317138##
sub EVENT_SPAWN {
  my $curhp = $npc->GetHP();
  my $HealPoints = -630000;
  $npc->SetHP($curhp + $HealPoints);
  }
sub EVENT_DEATH {
my @hatelist = $npc->GetHateList();	#Get every entity on hatelist
		foreach $ent (@hatelist) {
   quest::spawn2(317128,0,0,425.5,4911.8,275.5,28.9);	
   quest::depopall(317129);
   quest::depopall(317130);
   quest::depopall(317131);
   quest::depopall(317132);
   quest::depopall(317133);
   quest::signalwith(317128,999,0);
   $ent->Message(14,"The walls of Anguish tremble, you can feel the world shaking your bones. For a brief moment you think you see a smile flash across Mata Muram's face, and as the last breath escapes his lungs you hear a faint voice,");
   $ent->Message(15,"There are worlds other than these...");
 }
 }