sub EVENT_SAY {
  if ($ulevel <= 50 && $text=~/Hail/i){
   quest::say("Be gone youngster! There is nothing for you here but death.");
   }
  if($ulevel >= 51 && $text=~/hail/i) {
   quest::say("You want the Dryad necklace?? I may have it but I will never part with it! Prepare to die $name!");
   quest::spawn2(181521,0,0,372.5,-1626.3,-15.4,10.8);
   quest::spawn2(181523,0,0,393.4,-1683.5,-12.5,254.1);
   quest::spawn2(181524,0,0,330.8,-1651.8,-10.1,27.2);
   quest::spawn2(181525,0,0,337.2,-1600.1,-14.6,56.6);
   quest::spawn2(181525,0,0,417.2,-1640.3,-19.7,230.9);
   quest::depop();
   }
 }