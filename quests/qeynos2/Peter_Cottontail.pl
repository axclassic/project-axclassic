## Peter_Cottontail ID 2158 North Qeynos##
##Easter Event ##

sub EVENT_SAY {
  my $rebelling = quest::saylink("rebelling", 1);
  my $themselves = quest::saylink("themselves", 1);
  my $willing = quest::saylink("willing", 1);
  my $means = quest::saylink("means", 1);
  my $help = quest::saylink("help", 1);

   if ($text=~/Hail/i) {
    quest::say("I dont understand. Why would my bretheren rabbits be $rebelling?");
    }
   elsif ($text=~/rebelling/i) {
    quest::say("Yes! Easter Bunnies throughout Norrath have decided that they would not be hiding Easter Eggs this year. They intend to keep them for $themselves.");
	}
   elsif ($text=~/themselves/i) {
    quest::say("It is a shame, All the boys and girls wont be able to enjoy the annual Easter Egg Hunt...... Unless you are $willing to assist me with this problem.");
    }	
   elsif ($text=~/willing/i) {
    quest::say("I need you to track down my wayward brothers and collect the Easter Eggs from them by whatever $means is necessary.");
    }
   elsif ($text=~/means/i) {
    quest::say("I have heard rumors that my wayward brothers have recruited guards to protect them. I am sure they wont give the Easter Eggs up without a fight. I need the Easter Eggs back so I can try and correct this issue before its too late. Will you $help?");
	}
   elsif ($text=~/help/i && $ulevel <= 49) {
   quest::assigntask(187);
   quest::say("Thank you $name, Take this basket to collect the Easter Eggs in and return it to me when you have finished collecting them.");
   quest::summonitem(120281);
   }
  elsif ($text=~/help/i && $ulevel => 50) {
   quest::assigntask(171);
   quest::say("Thank you $name, Take this basket to collect the Easter Eggs in and return it to me when you have finished collecting them.");
   quest::summonitem(120281);
  }
   else {
   quest::say("Enjoy your holiday $name.");
   }
  }
    sub EVENT_ITEM {
if(($ulevel == 1) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
   quest::ding();
   quest::exp(1950);
}
elsif(($ulevel == 2) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(13600);
}
elsif(($ulevel == 3) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(37100);
}
elsif(($ulevel == 4) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(71600);
}
elsif(($ulevel == 5) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(119040);
}
elsif(($ulevel == 6) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(176500);
}
elsif(($ulevel == 7) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(247000);
}
elsif(($ulevel == 8) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(328300);
}
elsif(($ulevel == 9) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(420000);
}
elsif(($ulevel == 10) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(525000);
}
elsif(($ulevel == 11) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(645000);
}
elsif(($ulevel == 12) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(775000);
}
elsif(($ulevel == 13) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(910000);
}
elsif(($ulevel == 14) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(1060000);
}
elsif(($ulevel == 15) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(1225000);
}
elsif(($ulevel == 16) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(1400000);
}
elsif(($ulevel == 17) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(1580000);
}
elsif(($ulevel == 18) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(1775000);
}
elsif(($ulevel == 19) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(1990000);
}
elsif(($ulevel == 20) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(2230000);
}
elsif(($ulevel == 21) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(2470000);
}
elsif(($ulevel == 22) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(2710000);
}
elsif(($ulevel == 23) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(2950000);
}
elsif(($ulevel == 24) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(3215000);
}
elsif(($ulevel == 25) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(3485000);
}
elsif(($ulevel == 26) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(3875000);
}
elsif(($ulevel == 27) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(4080000);
}
elsif(($ulevel == 28) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(4400000);
}
elsif(($ulevel == 29) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(4720000);
}
elsif(($ulevel == 30) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(10350000);
}
elsif(($ulevel == 31) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(6000000);
}
elsif(($ulevel == 32) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller;
	quest::ding();
   quest::exp(6400000);
}
elsif(($ulevel == 33) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(6800000);
}
elsif(($ulevel == 34) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(7200000);
}
elsif(($ulevel == 35) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(16000000);
}
elsif(($ulevel == 36) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(8900000);
}
elsif(($ulevel == 37) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(9300000);
}
elsif(($ulevel == 38) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(9800000);
}
elsif(($ulevel == 39) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(10350000);
}
elsif(($ulevel == 40) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(23500000);
}
elsif(($ulevel == 41) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(12400000);
}
elsif(($ulevel == 42) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(13000000);
}
elsif(($ulevel == 43) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(13750000);
}
elsif(($ulevel == 44) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(14450000);
}
elsif(($ulevel == 45) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(33000000);
}
elsif(($ulevel == 46) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(16950000);
}
elsif(($ulevel == 47) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(17700000);
}
elsif(($ulevel == 48) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(18450000);
}
elsif(($ulevel == 49) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(19200000);
}
elsif(($ulevel == 50) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(19950000);
}
elsif(($ulevel == 51) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(46750000);
}
elsif(($ulevel == 52) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(51000000);
}
elsif(($ulevel == 53) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(55000000);
}
elsif(($ulevel == 54) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(90000000);
}
elsif(($ulevel == 55) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(97500000);
}
elsif(($ulevel == 56) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(107000000);
}
elsif(($ulevel == 57) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(115500000);
}
elsif(($ulevel == 58) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(124000000);
}
elsif(($ulevel == 59) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(173500000);
}
elsif(($ulevel == 60) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(103500000);
}
elsif(($ulevel == 61) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(66000000);
}
elsif(($ulevel == 62) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(69000000);
}
elsif(($ulevel == 63) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(70500000);
}
elsif(($ulevel == 64) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(73000000);
}
elsif(($ulevel == 65) && ($itemcount{120282} == 1)) {
    quest::say("Well done $name, here is your reward.");
	quest::summonitem(120323); ##Easter event Lucky Rabbit Foot Aug
	quest::summonitem(120314); ##Special Event Distiller
	quest::ding();
   quest::exp(75500000);
}
  else {
   #do nothing;
 }
 }