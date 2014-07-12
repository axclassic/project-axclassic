#######################################
## NPC: Casino                       ##
## Zone: Plane of Knowledge          ##
## Quest: None                       ##
## Created by Caved for AXClassic    ##
## The Rathe Server     10-07-2014   ##
#######################################
sub EVENT_SAY { 

  if ($text=~/hail/i) {
    $client->Message(14,"Hello $name , WELCOME to the Casino, in the future I will roll the diece for you so you can win grand prices. You will need to give me 1 small gold token (you can buy them from the vendor on the right) to spin the diece.");
  }
  else {
   return 1;
}
}
sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}
sub EVENT_ENTER {
	$npc->SetAppearance(1);
	my $random_result = int(rand(100));

	if ($random_result<=20) {
	quest::shout("Come place your bets next to the main bank, give me 1 small gold token and lets roll. Do you have what it takes? ARE you a WINNER? You KNOW you want me to roll the diece... GREAT prices PLAY now!");
	}
        else {
	#Do Nothing
 }
}


sub EVENT_SIGNAL {
    my $random_result = int(rand(100));
    
       if($random_result<=20) {
    quest::shout("Come place your bets next to the main bank, give me 1 small gold token and lets roll. Do you have what it takes? ARE you a WINNER? You KNOW you want me to roll the diece... GREAT prices PLAY now!");
    }
       else {
    #say nothing
 }
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 59970 => 1)) {
    $client->Message(14,"Thank you $class , ROLLING the Diece..."); #Small Gold Token Handin
    my $random_lot = int(rand(1000));
     if ($random_lot < 750) {
        $client->Message(14,"BAD luck $name , unfortunatly you rolled: $random_lot But you need to roll 750+ for a price. Better luck next time...");
        return 1;
        } 
     elsif ($random_lot >= 750) {
        $client->Message(14,"Good roll Your lucky number: $random_lot $name , you are a winner!");
         my $win_win = int(rand(50));
              
              #####0 tm 30 Gem win########################################################
              if ($win_win <= 30){
              my @itemgem = (10031,10032,10033,10034,10035,10036,10037,22503,10053,10049,59970,59970,59970,59970,59970);            
              my $cashgem = $itemgem[ rand @itemgem ];
              $client->Message(14,"YOU WON! $name! Here is your price. You won a gem!");
              quest::summonitem($cashgem);
              quest::exp(1000);
              quest::ding();
              return 1;
              }

                        
              ####end gem win#############################################################
              ####begin item win 31 tm 45#################################################
              elsif ($win_win == 31) { quest::summonitem(29648); } #White Dragon Helm
              elsif ($win_win == 32) { quest::summonitem(25201); } #Velium Encrusted Gauntlets
              elsif ($win_win == 33) { quest::summonitem(25209); } #Helmet of Rallos Zek
              elsif ($win_win == 34) { quest::summonitem(68698); } #Trusik Cloak of Carnage
              elsif ($win_win == 35) { quest::summonitem(14730); } #Circlet of Shadow
              elsif ($win_win == 36) { quest::summonitem(50187); } #Elaborate Defiant Breastplate
              elsif ($win_win == 37) { quest::summonitem(119499); } #Stone of the Dark Elf
              elsif ($win_win == 38) { quest::summonitem(119667); } #Stone of the Gnome
              elsif ($win_win == 39) { quest::summonitem(131); } #Greater Moonstone of Circles
              elsif ($win_win == 40) { quest::summonitem(132); } #Greater Moonstone of Portals
              elsif ($win_win == 41) { quest::summonitem(614); } #Fabled Lodizal Shell Shield
              #elsif ($win_win == 42) { quest::summonitem(); }
              #elsif ($win_win == 43) { #quest::summonitem(); } 
              #elsif ($win_win == 44) { quest::summonitem(); } 
              #elsif ($win_win == 45) { quest::summonitem(); } 
              ####end item win 31 tm 45#################################################
              
              ####begin main price item win 45 tm 50####################################
              elsif ($win_win == 46) { 
                 #quest::summonitem(); 
                 quest::shout2("$name has won the JACKPOT, $name gets nothing thistime, I am keeping this price for myself!");
                 }
              elsif ($win_win == 47) { 
                 #quest::summonitem(); 
                 quest::shout2("$name has won the JACKPOT, $name gets nothing thistime, I am keeping this price for myself!");
                 }
              
              elsif ($win_win == 48) { 
                 quest::summonitem(7867); #Black Ornate Chain Bridle
                 quest::shout2("$name has won the JACKPOT, $name won a beautifull black horsie, CONGRATULATIONS!");
              }
             
              elsif ($win_win == 49) { 
                 quest::summonitem(46852);  #Ornate Mask Of Fallen Dreams
                 quest::shout2("$name has won the JACKPOT, $name pocketed an Ornate Mask Of Fallen Dreams, CONGRATULATIONS!");
              }
              elsif ($win_win == 50) { 
                 quest::summonitem(21823); #Huge bag of platinum pieces 36 Kpp
                 quest::shout2("$name has won the JACKPOT, $name pocketed a Huge Bag of Platinum Pieces, CONGRATULATIONS!");
              }
              ####end main price item win 35 tm 40######################################
              quest::exp(1000);
              quest::ding();
              return 1;
              }


}

 
else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
 }