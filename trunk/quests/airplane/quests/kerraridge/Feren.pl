#NPC: Feren   Zone: kerraridge
#Quest: Kerran Fishing Pole
#by Qadar

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Rarr.  Me is Feren.  Me is fisher.  That means Feren catches [fish].");
}
if($text=~/fish/i){
quest::say("All kinds of fish.  Tasty fish.  All day Feren catches the fishes so all Kerran can eat.  I do for good of all Kerran.  Rrrrr.  One thing bother Feren always though.  Is bad fish.  [Razortooth].");
}
if($text=~/razortooth/i){
quest::say("Rrrrrr!  Razortooth mean fish.  Razortooth eat fish off Feren's line.  Razortooth gnaw Feren's boat.  Razortooth smart and dangerous.  Feren never able to catch Razortooth.  This haunt Feren for months.  If you was able to catch Razortooth. Feren be forever grateful. Maybe even give you possessions."); }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 6348 => 1)){
     quest::say("Razortooth! You catch him!  Truly you be great fisher.  Please take this from me.  Feren is forever owing you.");
     quest::faction(132,15);   # Guardians of Shar Val better
     quest::faction(175,15);   # Kerra Isle better
      quest::ding(); quest::exp(1000);
     quest::ding;
     quest::summonitem(1062);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}


#END of FILE Zone:kerraridge  ID:74088 -- Feren 


