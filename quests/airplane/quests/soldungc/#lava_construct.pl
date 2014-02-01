sub EVENT_SPAWN {
quest::settimer("construct",1);
  }
     
sub EVENT_TIMER { #depop doesn't work well with sub EVENT_SPAWN
$elemrest = $entity_list->GetMobByNpcTypeID(278124);
$furiousmagma = $entity_list->GetMobByNpcTypeID(278273);
$inflamedchamp = $entity_list->GetMobByNpcTypeID(278272);
$protectorfire = $entity_list->GetMobByNpcTypeID(278259);

if ($timer eq "construct") {
if ($elemrest || $furiousmagma || $inflamedchamp || $protectorfire) {
  quest::stoptimer("construct");
  quest::depop();
  } 
   }
    }
   
sub EVENT_DEATH {
  quest::signalwith(278125,90,0);
  }