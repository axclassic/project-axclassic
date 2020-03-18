# Qvic Raid Event: Iqthinxa Karnkvi

my $rage = 0;

sub EVENT_DEATH {
   quest::ze(10, "Your ears ring as the massive beast howls at the sky before falling over.");
   quest::signalwith(295130,1,0);
}

# signals from Iqthinxa Karnkvi
# 2 - The ravs are not all within 10% of each other, get harder and add AE Ramp
# 3 - You aren't the lowest HP so you need to emote as well
# 1 - Back within threshold, get easier again
sub EVENT_SIGNAL {
   if($signal == 1) {
      quest::modifynpcstat("max_hit", "1548");
      if($rage == 1) {
         $rage = 0;
         quest::modifynpcstat("special_attacks", "RFQMCNIDf");
      }
   }
   if($signal == 2) {
      quest::modifynpcstat("max_hit", "2250");
   }
   if($signal == 3) {
      quest::emote("goes into a frenzy to protect its wounded pack mate");
      quest::modifynpcstat("special_attacks", "RrFQMCNIDf");
      quest::modifynpcstat("max_hit", "2250");
      $rage = 1;
   }
}

