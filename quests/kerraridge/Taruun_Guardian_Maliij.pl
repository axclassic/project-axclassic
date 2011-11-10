#zone - KerraRidge
#quest - Melixis Ring
#Angelox 

sub EVENT_SAY {
  if ($text=~/hail/i){
    quest::emote("Peers into your eyes");
    quest::say("Hello $name, I am a member of the elite Guards of this town");
    quest::say("But in my spare time I hunt for gold and [jewelry], [sell] them around town.");}
  elsif ($text=~/jewel/i){
    quest::say("You know, necklaces, earings, [rings] ...");}
  elsif ($text=~/silver/i){
    quest::say("I will sell it to you for 25pp");}
  elsif ($text=~/ring/i){
    quest::say("Yes, rings too, I have only one now, the rest I sold to the jewelers");}
  elsif ($text=~/sell/i){
    quest::say("I have but one item for sell, and it is a [silver ring]. Has a rose engraved on the inside");
    quest::say("I found it out in the courtyard one day, behind one of the huts");}
}

sub EVENT_ITEM{
  if ($platinum>=25){
    quest::say("Here's the ring, nice doing business with you.");
    quest::summonitem(103);}
else {
quest::say("This is not what I asked for.");
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
 
 sub EVENT_COMBAT {
   if($combat_state == 1) {
   quest::say("Now feel the wrath of my sword!!");
   quest::say("For the protection of all Kerranians!");
   quest::say("This town will be a safer place now that we are here!");
   }
}
