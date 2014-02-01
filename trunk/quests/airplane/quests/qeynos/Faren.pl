#############
#NPC: Faren
#Quest Name: Faren's Tacklebox
#Quest by: 
#Updated by: BWStripes
#Revised: Olhadon
#NPCs Involved: Trumpy Irontoe
#Items Involved: Wooden Fishing Tackle ID:13702, Hurrieta's Tunic ID:13129
#zone: qeynos

sub EVENT_SPAWN {
  #Generating random number for timer.
  my $lower = 300; # ~5minutes
  my $upper = 1800; # ~30minutes
  my $randnum = int($lower+rand($upper-$lower));
  quest::settimer(1,$randnum);
}

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Oh.. Hiya, I'm just out here fishing, since I can't find a job. I hope this [bait] I just bought catches me a big ol' fish.");
  }
  elsif($text=~/what bait/i){
    quest::say("I use Captain Rohand's Secret Recipe Super Magic Catch-A-Lot brand bait. I bought my pole from Sneed's up by the north pond.");
  }
  elsif($text=~/what tacklebox/i){
    quest::say("Oh. That mean [dwarf], Trumpy, just knocked my tacklebox into the water. Could you please get it for me? I can't swim.");
  }
  elsif($text=~/fishboy/i){
    quest::say("Hey! My [tacklebox]! You rotten dwarf!");
  }
  elsif($text=~/wh(o|at).*?Dwarf/i){
    quest::say("His name is Trumpy. he is one of those [Irontoes] I think. I've seen him hanging out in Fish's Ale. I don't know why he likes to torment me.");
  }
  elsif($text=~/wh(o|at).*?Irontoes/i){
    quest::say("Ah! The Irontoes are a rough bunch of dwarves from Kaladim. They seem to get quite drunk on a frequent basis.");
  }
  elsif($text=~/what.*?biting/i){
    quest::say("Huh? OH! Sorry, I waas dozing off! It's been a slow day. A few fish and an old shoe are all i have reeled in. I did see a shark swim by, though!");
  }
}

sub EVENT_ITEM {
  #Wooden Fishing Tackle ID:13702
  if($itemcount{13702} == 1){
    quest::say("Thank you so much!  If you want some free advice, steer clear of those [Irontoes]! They are nothing but trouble. Here, It's not much but I must thank you somehow.");
    quest::summonitem("13129"); #Hurrieta's Tunic
    quest::faction("135","4"); #Guards of Qeynos
    quest::faction("9","4"); #Antonius Bayle
    quest::faction("53","-5"); #Corrupt Qeynos Guards
    quest::faction("33","-5"); #Circle Of Unseen Hands
    quest::faction("217","4"); #Merchants of Qeynos
    quest::ding(); quest::exp("200");
    quest::givecash(rand(20),"0","0","0");# Random from 20cp
  }
  else{
    quest::emote("I have no need for this $name, you can have it back.");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_TIMER{
  if ($timer == 1){
    quest::emote("Whoo!!!  I think I got a [bite]!  Darn..  Seaweed.");
    quest::stoptimer(1);
    #Generating random number for timer.
    my $lower = 300; # ~5minutes
    my $upper = 1800; # ~30minutes
    my $randnum = int($lower+rand($upper-$lower));
    quest::settimer(1,$randnum);
  }
  elsif ($timer == 2){
    $npc->GMMove($x, $y, $z, 63);
    quest::stoptimer(2);
  }
}

sub EVENT_SIGNAL {
  #response to Trumpy_Irontoe
  if ($signal == 1) {
    quest::say("Huh? What? My [tacklebox]!? You know I can't swim, you rotten [dwarf]!");
	quest::signalwith(1042, 2, 2);
  }
  #response to Trumpy_Irontoe
  elsif ($signal == 2) {
    quest::say("My name is not Skippy..");
  }
  #response to Guard_Beren
  elsif ($signal == 3) {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    quest::say("Oh, hi, Beren. Not too good so far. That [dwarf] keeps bothering me, too.");
    quest::signalwith(1090, 5, 2);
    $npc->GMMove($x, $y, $z, 191);
    quest::settimer(2,45); 
  }  
}

#END of FILE Zone:qeynos  ID:1159 -- Faren

