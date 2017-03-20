sub EVENT_SPAWN {
$npc->SetAppearance(3);#sleeping
}
sub EVENT_SAY {
my $Duram = quest::saylink("Duram", 1);
  if($text=~/hail/i) {
  $npc->SetAppearance(0);#stand
  quest::say("Uuugh. . . I wish $Duram was here.");
  }
  if($text=~/Duram/i) {
  quest::say("Duram sent you? Unbelievable. Before I go anywhere, I need my sword back, it was taken from me earlier. That beast in there took it and knocked me down. . .he thought I was dead because I didn't move. Defeat him and bring me back my sword and I will leave.");
  quest::spawn2(316063,0,0,-1861,-742,-309.8,146.5);
  quest::settimer("Death",60);
  quest::say("You have 30 minutes to do what I could not.");
   }
 }
 
  sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 69974 => 1)) {
    quest::say("My sword, you have brought it back to me. Thank you $name, you truly are heroic.");
    quest::say("At last I am free again! Thank you so much for saving me from the horrors of this vile place. You have my gratitude. I can find my way out from here friend. Here take this note. I am sure you will find a use for it.");
    quest::summonitem(69973);
    quest::depop();
    }
    elsif(plugin::check_handin(\%itemcount, 120221 => 1)) {
    quest::say("My sword, Oh My it is broken! Thank you for trying to bring it back to me. I have no other option but to return to my home and forge a new sword.");
    quest::say("I can find my way out from here friend.");
    quest::depop();
    }
    else{
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
          return 1;
    }
   }
sub EVENT_TIMER {
    if($timer eq "Death"){
    quest::stoptimer("Death");
    quest::depop(316063);
    quest::depop();
    }
   }
