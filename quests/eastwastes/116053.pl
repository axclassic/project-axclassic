##############################################
## Spawns Korrigain (116567) at night	    ##
## By Angelox				    ##
## Este libro tiene que ir a la biblioteca! ##
##############################################
sub EVENT_SPAWN{
   if (($Korr !=1) && (($zonetime >= 0)&&($zonetime <= 600) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::spawn2(116567,0,0,3250,-7970,145,0);
      $Korr=1;
    }
   else { 
      quest::depop(116567);
      $Korr=0;
    }
  }

sub EVENT_WAYPOINT{
   if (($Korr !=1) && (($zonetime >= 0)&&($zonetime <= 600) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::spawn2(116567,0,0,3250,-7970,145,0);
      $Korr=1;
   }
   elsif (($Korr=1) && (($zonetime >= 601)&&($zonetime <= 1959))){
      quest::depop(116567);
      $Korr=0;
    }
  }
## End spawn Script