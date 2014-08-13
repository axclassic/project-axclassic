sub EVENT_SAY { 
my $materials = quest::saylink("materials", 1);
my $blood = quest::saylink("blood", 1);
my $illweed = quest::saylink("illweed", 1);
if($text=~/Hail/i){
quest::say("You have come to learn. have you not?  I have knowledge of importance to young warriors of the legion.  Or perhaps you are a scribe seeking my unique writing $materials!");
}
if($text=~/materials/i){
quest::say("You must be a scribe of sorts?  Always glad to assist a talented youth.  I make two things unique to Cabilis and important to any future master scribe.  I can create $blood ink and $illweed parchment.");
}
if($text=~/blood/i){
quest::say("If blood ink is what you seek. then only I can provide it.  I use a unique blend prepared by my secret method.  I can supply you with a vial of blood ink. but first you must fetch me four ingredients.  I need globules of blood from certain creatures.  I need globules from the carnivorous plants. leeches and mosquitoes.  I also need globules from the blood pit of the Tower of Death.  Bring me these and be quick. or the blood will disintegrate.");
}
if($text=~/illweed/i){
quest::say("If you wish to obtain a page of my illweed parchment. you only have to perform a simple task.  Bring me four illweed reeds from the Lake of Ill Omen.  You may find that the only way one can find illweed is to go fishing.");
}
}

sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 12389 => 4)) {
   quest::say("I hope your fishing skills improved, to you this parchment it useless.");
   quest::summonitem(12385);
   quest::ding();
   qest::exp(1000);
  }
  elsif (plugin::check_handin(\%itemcount, 119938 =>1, 119939 =>1, 119940 =>1, 119941 =>1 )) {
   quest::say("Here is your blood ink, too bad it it useless to you.");
   quest::summonitem(119942);
   quest::ding();
   qest::exp(1000);
}
   else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
}   
#END of FILE Zone:cabeast  ID:5321 -- War_Historian_Kobl 

