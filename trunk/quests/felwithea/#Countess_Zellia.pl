##########################################################################
### Countess Zellia's Bloodhunt Event. 					##
### Turn in any four NPC blood (no vials), and you get a random defiant.##
### By Angelox, spawns in all starter zones if global is set.		##
##########################################################################
sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_SAY {
if ($event3==1){
 my $bloodhunt = quest::saylink("Bloodhunt", 1);
 my $help3 = quest::saylink("help", 1);
 my $loots3 = quest::saylink("blood-loots", 1);
 my $thirst = quest::saylink("thirst", 1);
 my $puppy = quest::saylink("puppy", 1);
 my $creature = quest::saylink("creature", 1);
 my $kill = quest::saylink("kill", 1);
 my $william = quest::saylink("William", 1);
   if ($text=~/hail/i){
     $client->Message(14,"Hello $name! We are on a $bloodhunt! care to join?");
     }
   elsif ($text=~/Bloodhunt/i){
    $client->Message(14,"Aye, My $thirst for blood is more than I can handle, I need $help3 in obtaining it,  ");
   }
   elsif ($text=~/help/i){
    $client->Message(14,"Bring me four $loots3 and I will reward you well!");
    }
   elsif ($text=~/blood-loots/i){
    $client->Message(14,"What I need is blood with a name on it,  as in \"human blood\" or \"ogre blood\".");
    }
   elsif ($text=~/thirst/i){
    $client->Message(14,"I never wanted to be like this, I fell victim to $puppy love.");
    }
   elsif ($text=~/puppy/i){
    $client->Message(14,"\"Love at first sight\", I was blinded in love, thought he would be my partner for life. Turned out, all he ever wanted was to suck the blood life out of me.");
    $client->Message(14,"Once bitten, I too became a $creature of the night.");
    }
   elsif ($text=~/creature/i){
    $client->Message(14,"Aye, a Vampire, slave to my own blood-thirst! Roaming the realms at night searching for blood and begging for $help3.");
    }
   elsif ($text=~/kill/i){
    $client->Message(14,"His name is $william, I believe he sleeps with the vampires of the Castle Mistmoore in Lesser Faydark. A vampire with no heart can be no more - bring me his evil heart so I can burn it myself. ");
    }
   elsif ($text=~/william/i){
    $client->Message(14,"Aye, evil has another name, that name is William. Seek him out and kill him.");
    }
  }
else {
    $client->Message(14,"This event is not for today!");
 }
}
 sub EVENT_ITEM{
if ($event3==1){ 
   my @itemy = (1784,1858,2646,2693,3492,3633..3635,36427885,10418,14049,14227,17444,17458,17460,17536,17539,20497,20784,22514..22516,22519,22522,22524,22526,22533,22570,22645,22915,26028,26635,26979,28303,28786,29346,29419,29521..29526,32604,32609,32630,32671,33905,33932,33946,33947,33954,35100,42745..42751,52273,52494,54467,54531,54567,54600,55256,55850,57058,58049,59036,59043,59049,60012,60014,60016,63094,63831,63832,65431,67489,69309,69343,69919,72024,72032,72042,72057,72066,72073,77639,77767,79684,88050,88091,97300,97309,97317,97322,97325,97328,97334,97338,97340,97343,97345,97352,97367,); ## Any NPC blood for summer bloodhunt event
   my $total2 = 0;
   foreach my $xxitem (@itemy) {
   $total2 += $itemcount{$xxitem};
   };
   my @itemt = (50005 .. 50246); ## Summer Bloodhunt Event random item reward
   my $total3 = $itemt[ rand @itemt ];
    if ($total2 >= 4) {
     $client->Message(14,"Countess Zellia says,\"Thank you $name! Enjoy your reward.\"");
     quest::summonitem($total3);
     return;
     };
    if ($itemcount{624} == 1){
     $client->Message(14,"Finally! I may see the light of day soon...");
     quest::summonitem($total3);
     quest::emote("fades away into the night.");
     quest::delglobal("event3"); 
     quest::setglobal("event3",0,7,"F");
     $event1= undef; 
     quest::depop;
     return;
     }
    $client->Message(14,"This is not what I want.");
    plugin::return_items(\%itemcount);
  }
else {
 $client->Message(14,"Not today!"); 
  plugin::return_items(\%itemcount);
  if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
    quest::givecash($copper, $silver, $gold, $platinum);
   };
 };
};

sub EVENT_EXIT{
##Countess Event
my $random_result = int(rand(100));
 if(($event3==1) && ($random_result<=50)){
    quest::say("Perhaps if someone were to [kill] him, I might find myself among the living again..."); 
  }
 if ($event3==1){ 
    quest::emote("fades away into the night.");
    quest::depop;
  }
}