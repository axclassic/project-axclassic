## Farmer Glumr 14176 ecommons##
sub EVENT_SAY {
 my $help = quest::saylink("help", 1);
  
   if($text =~ /Hail/i) {
   quest::say("Hello $name. I have traveled to the Commonlands in search of someone willing to right the terrible wrong that befallen upon me.");
   quest::say("I have prayed to Karana that a great $class like you would arrive to assist me, You see, my turkeys have gone wild and all flown the coop! Can you $help me?"); 
   }
   if($text =~ /help/i) {
   quest::say("You must find them for me. Head to my farm in East Karana and speak with my son...he can tell you more. Good luck, $name.");
   quest::assigntask(196);
   quest::setglobal("Thanksturkey", 1, 5, "F"); #Allows you to talk to Master Glumr in East Karana
   }
   }
sub EVENT_ITEM {
   my @itemt = (120333 .. 120337); ## Thanksgiving Event random item reward
   my $total3 = $itemt[ rand @itemt ];
    
   if(($ulevel == 1) && ($itemcount{120332} == 1)) {
   quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
   quest::ding();
   quest::exp(1950);
   quest::summonitem($total3);
}
elsif(($ulevel == 2) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(13600);
   quest::summonitem($total3);
}
elsif(($ulevel == 3) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(37100);
   quest::summonitem($total3);
}
elsif(($ulevel == 4) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(71600);
   quest::summonitem($total3);
}
elsif(($ulevel == 5) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(119040);
   quest::summonitem($total3);
}
elsif(($ulevel == 6) && ($itemcount{120332} == 1)) { 
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(176500);
   quest::summonitem($total3);
}
elsif(($ulevel == 7) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(247000);
   quest::summonitem($total3);
}
elsif(($ulevel == 8) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(328300);
   quest::summonitem($total3);
}
elsif(($ulevel == 9) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(420000);
   quest::summonitem($total3);
}
elsif(($ulevel == 10) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(525000);
   quest::summonitem($total3);
}
elsif(($ulevel == 11) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(645000);
   quest::summonitem($total3);
}
elsif(($ulevel == 12) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(775000);
   quest::summonitem($total3);
}
elsif(($ulevel == 13) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(910000);
   quest::summonitem($total3);
}
elsif(($ulevel == 14) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(1060000);
   quest::summonitem($total3);
}
elsif(($ulevel == 15) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(1225000);
   quest::summonitem($total3);
}
elsif(($ulevel == 16) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(1400000);
   quest::summonitem($total3);
}
elsif(($ulevel == 17) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(1580000);
   quest::summonitem($total3);
}
elsif(($ulevel == 18) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(1775000);
   quest::summonitem($total3);
}
elsif(($ulevel == 19) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(1990000);
   quest::summonitem($total3);
}
elsif(($ulevel == 20) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(2230000);
   quest::summonitem($total3);
}
elsif(($ulevel == 21) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(2470000);
   quest::summonitem($total3);
}
elsif(($ulevel == 22) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(2710000);
   quest::summonitem($total3);
}
elsif(($ulevel == 23) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(2950000);
   quest::summonitem($total3);
}
elsif(($ulevel == 24) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(3215000);
   quest::summonitem($total3);
}
elsif(($ulevel == 25) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(3485000);
   quest::summonitem($total3);
}
elsif(($ulevel == 26) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(3875000);
   quest::summonitem($total3);
}
elsif(($ulevel == 27) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(4080000);
   quest::summonitem($total3);
}
elsif(($ulevel == 28) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(4400000);
   quest::summonitem($total3);
}
elsif(($ulevel == 29) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(4720000);
   quest::summonitem($total3);
}
elsif(($ulevel == 30) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(10350000);
   quest::summonitem($total3);
}
elsif(($ulevel == 31) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(6000000);
   quest::summonitem($total3);
}
elsif(($ulevel == 32) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(6400000);
   quest::summonitem($total3);
}
elsif(($ulevel == 33) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(6800000);
   quest::summonitem($total3);
}
elsif(($ulevel == 34) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(7200000);
   quest::summonitem($total3);
}
elsif(($ulevel == 35) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(16000000);
   quest::summonitem($total3);
}
elsif(($ulevel == 36) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(8900000);
   quest::summonitem($total3);
}
elsif(($ulevel == 37) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(9300000);
   quest::summonitem($total3);
}
elsif(($ulevel == 38) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(9800000);
   quest::summonitem($total3);
}
elsif(($ulevel == 39) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(10350000);
   quest::summonitem($total3);
}
elsif(($ulevel == 40) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(23500000);
   quest::summonitem($total3);
}
elsif(($ulevel == 41) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(12400000);
   quest::summonitem($total3);
}
elsif(($ulevel == 42) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(13000000);
   quest::summonitem($total3);
}
elsif(($ulevel == 43) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(13750000);
   quest::summonitem($total3);
}
elsif(($ulevel == 44) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(14450000);
   quest::summonitem($total3);
}
elsif(($ulevel == 45) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(33000000);
   quest::summonitem($total3);
}
elsif(($ulevel == 46) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(16950000);
   quest::summonitem($total3);
}
elsif(($ulevel == 47) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(17700000);
   quest::summonitem($total3);
}
elsif(($ulevel == 48) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(18450000);
   quest::summonitem($total3);
}
elsif(($ulevel == 49) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(19200000);
   quest::summonitem($total3);
}
elsif(($ulevel == 50) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(19950000);
   quest::summonitem($total3);
}
elsif(($ulevel == 51) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(46750000);
   quest::summonitem($total3);
}
elsif(($ulevel == 52) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $$name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(51000000);
   quest::summonitem($total3);
}
elsif(($ulevel == 53) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(55000000);
   quest::summonitem($total3);
}
elsif(($ulevel == 54) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(90000000);
   quest::summonitem($total3);
}
elsif(($ulevel == 55) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(97500000);
   quest::summonitem($total3);
}
elsif(($ulevel == 56) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(107000000);
   quest::summonitem($total3);
}
elsif(($ulevel == 57) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(115500000);
   quest::summonitem($total3);
}
elsif(($ulevel == 58) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(124000000);
   quest::summonitem($total3);
}
elsif(($ulevel == 59) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(173500000);
   quest::summonitem($total3);
}
elsif(($ulevel == 60) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(103500000);
   quest::summonitem($total3);
}
elsif(($ulevel == 61) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(66000000);
   quest::summonitem($total3);
}
elsif(($ulevel == 62) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(69000000);
   quest::summonitem($total3);
}
elsif(($ulevel == 63) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(70500000);
   quest::summonitem($total3);
}
elsif(($ulevel == 64) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(73000000);
   quest::summonitem($total3);
}
elsif(($ulevel == 65) && ($itemcount{120332} == 1)) {
    quest::say("Thank you so much, $name! Please, accept this token of our gratitude for your troubles!");
   quest::delglobal{"Thankssmglumr"};
	quest::ding();
   quest::exp(75500000);
   quest::summonitem($total3);
}
  else {
   #do nothing;
 }
}   
