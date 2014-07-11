#######################################
## NPC: Casino                       ##
## Zone: Plane of Knowledge          ##
## Quest: None                       ##
## Created by Caved for AXClassic    ##
## The Rathe Server     10-07-2014   ##
#######################################
sub EVENT_SAY { 

  if ($text=~/hail/i) {
    $client->Message(14,"Hello $name , WELCOME to the Casino, in the future I will roll the diece for you so you can win grand prices. You will need to give me 1 small gold token (you can buy them from the vendor on the right) to spin the diece. I am now fully functional!");
  }
  else {
   return 1;
}
}

sub EVENT_ENTER {
	$npc->SetAppearance(1);
	my $random_result = int(rand(100));

	if ($random_result<=10) {
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
    }
     if ($random_lot < 950) {
        $client->Message(14,"BAD luck $name , unfortunatly you didnt win anything. better luck next time...");
        return 1;
        } 
     elsif ($random_lot >= 950) {
        $client->Message(14,"Good roll $name , you are a winner!");
         my $win_win = int(rand(30));

           if ($win_win <= 10){
           my @itemgem = (10031,10032,10033,10034,10035,10036,10037,22503,10053,10049);            my $cashgem = $itemt[ rand @itemgem ];
             $client->Message(14,"YOU WON! "$name! Here is your price. You won a gem!");
             my cashgem = $items[ rand @itemgem ];
             quest::summonitem($cashgem);
             return 1;
        }


  }
}

 
else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
}