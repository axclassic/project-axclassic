#BeginFile: everfrost\Magus_Delin.pl
#
#

sub EVENT_SAY {
  if($ulevel >= 15) {
    if(plugin::check_hasitem($client, 41000) || $client->KeyRingCheck(41000)) { #Adventurer's Stone
      if($text=~/hail/i) {
         my $random_result = int(rand(100));
         if($random_result<=45) {
            quest::say("I hear that you use Moonstones for travel around here.");
         }
         elsif($random_result<=60) {
            quest::emote("Looks toward the mountains dreaming of the after work skiing trip.");
         }
         elsif($random_result<=85) {
            quest::say("Sure, Arindri gets the sunny beach gig and I am stuck in the frozen tundra.");
         }
         else {
            quest::say("I hear that you use Moonstones for travel around here.");
         }
      }
    }
    else { #PC does not have Adventurer's Stone
      quest::say("You will have to excuse me, I am quite busy studying this Farstone and the possibility of using the magic stored inside of it. Perhaps you should talk to another at this camp to see if they have any use for you.");
    }
  }   
  else { #PC is not at appropriate level yet
    quest::say("You will have to excuse me, I am quite busy."); #Text made up
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}

#EndFile: everfrost\Magus_Delin.pl
