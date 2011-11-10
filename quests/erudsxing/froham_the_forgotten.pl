# Shaman Epic 1.0
# Froham the Forgotten
# Erud's Crossing (erudxing)
# Aramid September 2006

sub EVENT_SAY {
  if($text=~/hail/i) {
   quest::emote("looks up at you and mumbles a brief greeting. He appears uncomfortable around others.");
  }
  if($text=~/Who are you/i) {
   quest::emote("glances up at you, fiddling with his bony fingers and mumbles, 'Mmmm me name's Froham..I'm 'ere [waitin].");
  }
  if($text=~/waitin/i) {
    quest::say(". just waitin' . . . it'll [be ere soon], I s'pose");
  }
  if($text=~/soon/i) {
    quest::emote("obviously has trouble communicating. He shifts uncomfortably and says, 'Well I'm not sure, but it's real important. I been 'ere fer a [long time], a real long time. So I'll keep waitin' til it comes");
  }
  if($text=~/long time/i) {
    quest::say("Been 'ere since Erud sailed over with his friends. They let me catch a ride on their ship after I told them I needed to come 'ere to wait. He was a nice fella, real smart. Though I'm thinkin' he's dead by now. Maybe [Abe] knows fer sure. Abe's been here longer'n me, even.");
  }
  if($text=~/abe/) {
    quest::say("Yeah, Abe's an old guy. Well, he's kinda beyond bein' old if ye know what I mean. Not all together either. His mind floats all over like the sea around us. But he's got enough sense to wait here like he's done fer, well, fer dang near ever. If ye see him, and he ain't much fer talkin' straight, ask him about [a broken arrow]. Not sure what it means to him but it seems to bring him around.");
    quest::emote("sighs heavily and says, 'Looks like it's not comin'. You know, Abe told me of a great treasure a ways away from here, guarded by one o' them girls with fish tails. I always wanted to go but those two jokers, Dillon and the other young one, never had the guts. Why don't ye come with me, shaman? We'll split the treasure fifty-fifty, fair and square.");
    quest::signalwith(98046,300,15000);
    quest::moveto(3000,-1600,-250);
#    quest::spawn2(98050,0,0,4201.3,-1599.1,-292.7,70.5);
  }
}
  sub EVENT_SIGNAL {
    if ($signal == 399) {
      quest::depop();
    }
  }



# End of File - NPCID 98047 - Froham_the_Forgotten