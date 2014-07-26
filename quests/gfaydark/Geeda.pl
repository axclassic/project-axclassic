sub EVENT_SAY {
my $Crushbone = quest::saylink("Crushbone", 1);
my $assist = quest::saylink("assist", 1);
my $cause = quest::saylink("cause", 1);
  if($text =~ /Hail/i){
    quest::say("Are not the woods of the Faydarks a lovely sight? Tunare has truly blessed us. It is unfortunate that the orcs of $Crushbone Citadel have chosen to invade our lands.");
  }
  if($text=~/Crushbone/i){
    quest::say("Within the Greater Faydarks can be found the entrance to Crushbone Citadel, home of the orcs. They have increased their raids on our lands. We do not know why. The High Elder of Kelethin has instructed us to keep tabs on the orcs' movements. Hmmm.. How would you like to $assist the scouts?");
  }
  if($text=~/assist/i){
    quest::say("We trust this operation to high standing rogues of the Scouts of Tunare. Easy it may be, but the reward is a scout cape. The scout cape is meant for Scouts of Tunare only. Have you contributed to the Scouts' $cause?");
  }
  if($text=~/cause/i){
    quest::say("So we have heard. Here, then. Take this coin. Venture into Crushbone and find our scout, Kelynn. He is posing as a slave to gain information. He tries to work very close to an opening in a cave near the moats. Find this point and wait for him to appear. Give him the coin and he shall give you the information you are to return to me.");
    quest::summonitem(12184);
  }
}

sub EVENT_ITEM {
 #do all other handins first, then let it do disciplines
  if($itemcount{67702} == 1) {
    quest::say("Fine work. We are very grateful. Take this Scout Cape. May you use it to serve Kelethin.");
    quest::summonitem(2914);
    quest::faction(283,10);
     quest::ding(); quest::exp(5000);
    
  } else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
  }
}
