#Angelox

sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Wha?  Rarrrr!  Thalith try to fish but with [rrrats] and you botherring him. he cannot concentrate on water!  Go away. let Thalith fish!"); }
if($text=~/rats/i){
quest::say("Rats. Yes. Small, furry, brown, with teeth. They come, bite my paws, steal my bait, chew on lines and rods. They nasty little beasts and easy to kill but me not able to leave this position or fish get away. Errr. Maybe you keep the rats away? You kill baddest rat, Sharptooth. You bring me his tooth. I be very happy."); }
}

sub EVENT_ITEM{
  if ($itemcount{6347} == 1){
    quest::say("You.. You kill the rats? Errr. Thalith thanks you. Here. Take this. It's good luck charm I've had for years.");
    quest::summonitem(1061);
    quest::faction(132,15);      # Sharvahl
    quest::faction(175,15);      # Kera Isle
     quest::ding(); quest::exp(10); }
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

#END of FILE Zone:kerraridge  ID:74089 -- Thalith_Mamluk
