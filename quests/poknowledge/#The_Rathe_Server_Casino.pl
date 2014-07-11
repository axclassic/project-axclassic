#######################################
## NPC: Casino                       ##
## Zone: Plane of Knowledge          ##
## Quest: None                       ##
## Created by Caved for AXClassic    ##
## The Rathe Server     10-07-2014   ##
#######################################
sub EVENT_SAY { 

  if ($text=~/hail/i) {
    $client->Message(14,"Hello $name , WELCOME to the Casino, in the future I will roll the diece for you so you can win grand prices. You will need to give me 1 small gold token (you can buy them from the vendor on the right) to spin the diece. I am not 100% fully functional!");
  }
  else {
   return 1;
}
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
     if ($random_lot < 500) {
        $client->Message(14,"BAD luck $name , unfortunatly you didnt win anything. better luck next time...");
        return 1;
        } 
     elsif ($random_lot >= 500) {
        $client->Message(14,"Good roll $name , you are a winner!");
         my $win_win = int(rand(40));
              
              #####0 tm 20 Gem win########################################################
              if ($win_win <= 20){
              my @itemgem = (10031,10032,10033,10034,10035,10036,10037,22503,10053,10049);            
              my $cashgem = $itemt[ rand @itemgem ];
              $client->Message(14,"YOU WON! "$name! Here is your price. You won a gem!");
              quest::summonitem($cashgem);
              quest::exp(1000);
              quest::ding();
              return 1;
              }
              ####end gem win#############################################################
              ####begin item win 21 tm 35#################################################
              elsif ($win_win == 21) { quest::summonitem(127); }
              elsif ($win_win == 22) { quest::summonitem(128); }
              elsif ($win_win == 23) { quest::summonitem(129); }
              elsif ($win_win == 24) { quest::summonitem(130); }
              elsif ($win_win == 25) { quest::summonitem(131); }
              elsif ($win_win == 26) { quest::summonitem(132); }
              elsif ($win_win == 27) { quest::summonitem(133); }
              elsif ($win_win == 28) { quest::summonitem(134); }
              elsif ($win_win == 29) { quest::summonitem(135); }
              elsif ($win_win == 30) { quest::summonitem(136); }
              elsif ($win_win == 31) { quest::summonitem(137); }
              elsif ($win_win == 32) { quest::summonitem(138); }
              elsif ($win_win == 33) { quest::summonitem(139); }
              elsif ($win_win == 34) { quest::summonitem(139); }
              elsif ($win_win == 35) { quest::summonitem(139); }
              quest::exp(1000);
              quest::ding();
              return 1;
              }
              ####end item win 21 tm 35#################################################

}

 
else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
}