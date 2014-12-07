#Tatsujiro the Serene  NPC ID 337271#
sub EVENT_SAY {
  if($text=~/Hail/i){
  quest::say("Hail traveler, have a look at my wares, surely there is something that peaks your interest.");
  }
}
sub EVENT_ITEM {
  if ($ulevel == 41 && plugin::check_handin(\%itemcount, 81909 => 1)) {
  quest::say("How horrible! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't ease my feelings of guilt any, but you tried your best. We'll probably keep looking anyway, just in case. Thank you for your help.");
  quest::ding();
  quest::exp(639370);
  quest::givecash(0,0,0,50); 
  }
  elsif ($ulevel == 42 && plugin::check_handin(\%itemcount, 81909 => 1)) {
  quest::say("How horrible! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't ease my feelings of guilt any, but you tried your best. We'll probably keep looking anyway, just in case. Thank you for your help.");
  quest::ding();
  quest::exp(671710);
  quest::givecash(0,0,0,50); 
  }
  elsif ($ulevel == 43 && plugin::check_handin(\%itemcount, 81909 => 1)) {
  quest::say("How horrible! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't ease my feelings of guilt any, but you tried your best. We'll probably keep looking anyway, just in case. Thank you for your help.");
  quest::ding();
  quest::exp(704470);
  quest::givecash(0,0,0,50); 
  }
  elsif ($ulevel == 44 && plugin::check_handin(\%itemcount, 81909 => 1)) {
  quest::say("How horrible! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't ease my feelings of guilt any, but you tried your best. We'll probably keep looking anyway, just in case. Thank you for your help.");
  quest::ding();
  quest::exp(738010);
  quest::givecash(0,0,0,50); 
  }
  elsif ($ulevel == 45 && plugin::check_handin(\%itemcount, 81909 => 1)) {
  quest::say("How horrible! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't ease my feelings of guilt any, but you tried your best. We'll probably keep looking anyway, just in case. Thank you for your help.");
  quest::ding();
  quest::exp(1629580);
  quest::givecash(0,0,0,50); 
  }
  elsif ($ulevel == 46 && plugin::check_handin(\%itemcount, 81909 => 1)) {
  quest::say("How horrible! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't ease my feelings of guilt any, but you tried your best. We'll probably keep looking anyway, just in case. Thank you for your help.");
  quest::ding();
  quest::exp(869540);
  quest::givecash(0,0,0,50); 
  }
  elsif ($ulevel == 47 && plugin::check_handin(\%itemcount, 81909 => 1)) {
  quest::say("How horrible! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't ease my feelings of guilt any, but you tried your best. We'll probably keep looking anyway, just in case. Thank you for your help.");
  quest::ding();
  quest::exp(908180);
  quest::givecash(0,0,0,50); 
  }
  elsif ($ulevel == 48 && plugin::check_handin(\%itemcount, 81909 => 1)) {
  quest::say("How horrible! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't ease my feelings of guilt any, but you tried your best. We'll probably keep looking anyway, just in case. Thank you for your help.");
  quest::ding();
  quest::exp(947660);
  quest::givecash(0,0,0,50); 
  }
  elsif ($ulevel == 49 && plugin::check_handin(\%itemcount, 81909 => 1)) {
  quest::say("How horrible! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't ease my feelings of guilt any, but you tried your best. We'll probably keep looking anyway, just in case. Thank you for your help.");
  quest::ding();
  quest::exp(987980);
  quest::givecash(0,0,0,50); 
  }
  elsif ($ulevel == 50 && plugin::check_handin(\%itemcount, 81909 => 1)) {
  quest::say("How horrible! You mean that there aren't any living eggs in that nest at all! Oh, my. That certainly doesn't ease my feelings of guilt any, but you tried your best. We'll probably keep looking anyway, just in case. Thank you for your help.");
  quest::ding();
  quest::exp(1029140);
  quest::givecash(0,0,0,50); 
  }
          else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
}  