# Qvic Raid Event: Cynosure Kvanjji

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("You don't have the comprehension to understand my message, much less the power to stop it.");
   }
}

sub EVENT_DEATH {
   quest::ze(10, "As the massive creature falls to the ground you see a shimmer of magic.");
   quest::say("Fools, did you think I would fall with such ease. The message will be sent! This site will make a fine headstone for your graves!");
   quest::spawn2(295146,0,0,$x,$y,$z,$h);
   quest::spawn2(295150,0,0,-249.1,-126.7,-490.8,128.5);
   quest::spawn2(295149,0,0,-243,-250,-439,248);
   quest::spawn2(295148,0,0,-316,-181,-464,64);
   quest::spawn2(295147,0,0,-216,-191,-467,192);
}

# NPC #Cynosure_Kvanjji (295140)