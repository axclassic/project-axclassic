# AngeloX

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome! I am pleased to announce that the Royal Coin and Mint of Shar Vahl has made arrangements to make sure you are able to access your money and valued items from any other bank. Our Benevolent King Raja Kerrath ensures that this is a safe and efficient method of transaction."); }
}

sub EVENT_SPAWN{
 my $random_result = int(rand(100));
  if($riva==3){ #Riva should be up so spawn her
	quest::spawn_condition("kerraridge", 2,1); #Riva
	quest::spawn_condition("kerraridge", 1,0); #Skele
   }elsif  (($random_result<=20) && ($riva==2)) { #Riva not up but roll was good
	quest::spawn_condition("kerraridge", 2,1); #Riva
	quest::spawn_condition("kerraridge", 1,0); #Skele
   }else{ #Riva #not up so spawn Skele
	quest::spawn_condition("kerraridge", 2,0); #Riva
	quest::spawn_condition("kerraridge", 1,1); #Skele

   }
 }


sub EVENT_SIGNAL{ 
 if($signal == 1){			#Signal from Riva death - set back to skele
    quest::settimer("riva1",121);
    # quest::shout("$signal");
  }
 elsif($signal == 2){			#Signal from Skele death - Spawn Riva
   quest::settimer("riva2",121);
   # quest::shout("$signal");
  }
 elsif($signal == 3){              # Signal from Jailer Khazi
   quest::settimer("khazi1",1800);  # Set time til quest resets
  #quest::shout("Setting Timer");
  }
}


sub EVENT_TIMER{
  if ($timer eq "riva1"){			#Sets skele to spawn again
    quest::spawn_condition("kerraridge",2,0); #Riva 
    quest::spawn_condition("kerraridge",1,1); #Skele
    quest::delglobal("riva");
    quest::setglobal("riva",2,2,"F");
    $riva=undef;
    quest::stoptimer("riva1");}
  elsif ($timer eq "riva2"){		#Sets skele to spawn Riva
    quest::spawn_condition("kerraridge",2,1); #Riva 
    quest::spawn_condition("kerraridge",1,0); #Skele
    quest::delglobal("riva");
    quest::setglobal("riva",3,2,"F");
    $riva=undef;
    quest::stoptimer("riva2");}
  elsif ($timer eq "khazi1"){                            # resets Jailer Khazi's quest
    quest::depopall(74541);                              # get rid of escaped kobolds
    quest::spawn_condition("kerraridge",3,1);              # put them back in jail
    quest::delglobal("khazi");
    quest::setglobal("khazi",1,3,"F");
    $khazi=undef;
    quest::stoptimer("khazi1");
   #quest::shout("you didnt find them all, you lose");
  }
}

#END of FILE Zone:kerraridge  ID:155199 -- Banker_Naudi 


