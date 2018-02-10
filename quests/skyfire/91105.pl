my $leashX = 0;
my $leashY = 0;
my $leashZ = 0;
my $leashH = 0;

sub EVENT_SPAWN {
   $leashX = $x;
   $leashY = $y;
   $leashZ = $z;
   $leashH = $h;
}

sub EVENT_AGGRO {
   quest::settimer("LeashCheck",2);
}

sub EVENT_TIMER {
   if($timer eq "LeashCheck") {
      my $distanceCHK = $npc->CalculateDistance($leashX, $leashY, $leashZ);
      if($distanceCHK >= 50) {
         quest::stoptimer("LeashCheck");
         my $target = $npc->GetTarget();
         if($target) {
            $entity_list->RemoveFromTargets($target);
         }
         $npc->GMMove($leashX, $leashY, $leashZ, $leashH);
      }
   }
}

sub EVENT_DEATH {
   quest::stoptimer("LeashCheck");
}
# Servant_of_the_Peak

