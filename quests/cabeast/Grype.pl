# Grype, Cabilis East, Necro Skull Cap 6
# missing text, receives 30146 (The Broken Glacier Souvenir Mug, from halfling sawshbucliker, FV)
# gives Foot of Candlestick
# Cabilis Pale Ale by Kovou

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I will give you the Foot if you get the stein from that Halfling rogue, all in black, from Firiona Vie.");  
  }
if($text=~/Talon/i)   {
    quest::emote("takes a swipe at you. 'We used to be the bruisers of the west side. We didn't take nothin' from no one!! Fist and mind was our motto. Now get lost before I introduce my fist to your face. Hmpf. Too late, I see.'");
   }
    }
sub EVENT_ITEM {
my $Talon = quest::saylink("Talon", 1);
  if ($itemcount{30146}==1) { 
    quest::say("Well, as promised, here's your Foot.");
    quest::emote(' Kicks in the rear!!');
    quest::say("Sucker!!!");	
    }
  if (plugin::check_handin(\%itemcount, 12609 => 4)) {
    quest::emote(' swallows the whole bottle in one gulp.');
	quest::say("Here, go buy yourself a brain. What?!! You expecting something? How about this.. <BUUURRRPPPP!!> Thanks for helping me get through my dry spell, croak!! Never mess with a Blue $Talon!!");
    quest::givecash(1,0,0,0);
     quest::ding(); quest::exp(100);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}


#End of File zone:cabeast ID:106004 -- Grype