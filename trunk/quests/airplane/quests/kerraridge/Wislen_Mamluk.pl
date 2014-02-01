sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Why you bother Wislen?  Wislen trying to get fishies.  Leave Wislen alone to get [fish]. please.");
}
if($text=~/catfish/i){
quest::say("Kerra Catfish is what Wislen want.");}
elsif($text=~/fish/i){
quest::say("Fish.  Wislen fish.  Wislen is mamluk. not just fisher.  Mamluk is warrior but they also helps provide for all [Kerran].  This is hadi place in life.  We happy doing this.  Please. let Wislen fish now."); }
elsif($text=~/Kerran/i){
quest::say("Mostly they like [catfish], but  Wislen not have any luck today.");}
}

sub EVENT_ITEM{
  if ($itemcount{22748} == 1){
    quest::say("You caught catfish? Errr. Wislen thanks you. Here. Take this. It's one of my best fishing poles.");
    quest::summonitem(46996);
    quest::faction(132,15);      # Sharvahl
    quest::faction(175,15);      # Kera Isle
     quest::ding(); quest::exp(10); }
  elsif ($itemcount{13019} == 1){
    quest::say("Fish! Fish! Not again Fish! Take it back, I have too many.");
    quest::summonitem(13019);}
  else {
 quest::say("I have no use for this");
 plugin::return_items(\%itemcount);}
}

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::say("The time has come for you to die!");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("It is unwise of you to try that!");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("How dare you attack me!");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("The spirits will condem you!");
    }elsif($combat_state == 1){
    quest::say("I shall bathe in your blood!");}
}

sub EVENT_DEATH{
 quest::emote("'s corpse drops to the ground.");
 }

#END of FILE Zone:kerraridge  ID:74021 -- Wislen_Mamluk 

