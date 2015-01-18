sub EVENT_SPAWN {
my $yes = quest::saylink("yes", 1);
   quest::emote(' shudders, causing bits of mud to drip from her rotting face. Her voice wheezes out like a rotting accordian.');
   quest::say("'BOoOOo. I Am SURe you Did not exPEcT to see ME here . . . faTe DEMANDS a REmaTCh . . . YOU cONtinUe to TaUNt me. WHaT can HE poSsiBLy offEr that mAkes you BeHAve like a LAPdoG? FoR the LAST TIME . . . wiLL you tell me wHERe to find StANoS? Answer me! $yes or no."); 
   }
 
sub EVENT_SAY { 
   if($text=~/yes/i) {
   quest::emote(' rejoices, flames of anger dancing in her remaining eye.');
   quest::say("Hur hur . . . eXcELLent. STAnos shall meET his end, and SOON. You, hoWEVer, will not LIVe anoTHeR day. Can'T have you wARnINg him, Now cAN I?");
   quest::spawn2(56201,0,0,-905.6,-464.2,-110.8,83.1);
   quest::depop();
   }
 }
