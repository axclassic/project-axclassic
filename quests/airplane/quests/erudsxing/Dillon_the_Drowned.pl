# Shaman Epic 1.0
# Dillon the Drowned
# Erud's Crossing (erudxing)
# Aramid September 2006

sub EVENT_SPAWN {
   quest::say("Well met again, Srafen. How goes it?");
 }

sub EVENT_SAY {
  if($text=~/hail/i) {
   quest::say("Hey Srafen, who is this weirdo talking to me? Or is it another one of those funny illusions Froham keeps talking about?");
   #quest::signalwith(98046,199,500);
  }
  if($text=~/bore/i) {
   quest::say("Well ok, I was sent here a long time ago to wait. When I got here, I couldn't believe all the violence going on. Why would the spirits send me here to wait when all this fighting and commotion was going on, I wondered. There were great battles on the ocean in splendid ships made of pine and shining with [magical enhancements]. While I was waiting below, blasted, bloody body parts were floating down to the bottom of the ocean all around me.");
  }
  if($text=~/enhancements/i) {
   quest::say("Yes, their ships were very strange, constructed in very unusual designs and all seemed to shine with a multicolored glow. I heard there was even a ship that could stay completely underwater for long periods of time. It had huge steel spikes protruding from the top of its hull used to 'swim' under enemy ships and puncture their hulls. I always thought that someday all this magic would cause something [disastrous] and eventually, it did.");
  }
  if($text=~/disastrous/i) {
   quest::say("Well, one time, I was here waiting as usual. The fighting was particularly heavy up top, lots of banging and rumbling around. And suddenly there was a tremendous screech! I had to cover my ears, it was so loud, even down here. It felt like the water itself was being torn asunder; I could imagine what was happening above. After a few seconds of the screeching came a terrible tremor and rumbling.");
   quest::say("Great cracks opened up around me and water rushed to fill them, almost dragging me down into the gods know what. It calmed down a little while after that and there hasn't been any real fighting ever since. I suspect they're all dead now. For weeks afterwards, the water had a kind of dead taste to it. I became ill during that time.");
   quest::signalwith(98046,298,10000);
#   quest::spawn2(98047,0,0,4220.0,-1610.0,-287.3,0.0);
  }
}

sub EVENT_SIGNAL {
  if ($signal == 299) {
    quest::say("Again? Oh I don't know Srafen, I don't want to [bore] our company, even if it is an illusion.");
  }
  if($signal == 399) {
    quest::depop();
  }
}


# End of FIle - NPCID 98051 - Dillon_the_Drowned