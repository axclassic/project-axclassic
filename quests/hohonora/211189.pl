##Drizmun AK'Tel 211189##
sub EVENT_SAY {
my $Guardians = quest::saylink("Guardians", 1);
my $strike = quest::saylink("strike", 1);
my $willing = quest::saylink("willing", 1);
if ($text=~/Hail/i && $qglobals{"Djinnsix"} == 1) {
quest::say("Quickly $name, no time to loose! Your defeat of the Captains of Chaos has not gone unnoticed. I am sure you have already run into the $Guardians but now is the time to strike while they are weakened from loosing their Captians.");
quest::delglobal("Djinnsix");
quest::setglobal("Djinnseven", 1, 5, "F");
}
elsif ($text=~/Guardians/i && $qglobals{"Djinnseven"} == 1) {
quest::say("Yes, the creatures that lock the passage ways into the deeper temples where the Masters of Chaos reside now. These Guardians are the masters own creations, powerful beings that have never been defeated. However, with the defeat of the Captians, the forces of Chaos have been weakened and now is our opportunity to $strike and break our way through to the Masters themselves.");
}
elsif ($text=~/strike/i && $qglobals{"Djinnseven"} == 1) {
quest::say("Very well $name, I will warn you though, these beings are like anything you have encountered. They are protected by the very life force of the masters and are rumored to be invulnerable to most magic and weapons.");
quest::say("You would be wise to invest some time obtaining the magical weapons from the visers. Also if you happen to defeat these beings, keep an eye out for Stones of Dark Energy.");
quest::say("Take this container, if you manage to collect six Stones of Dark Energy, one from each of the Guardians, place them in this box, combine them and return it to me. We are looking into ways to manipulate this energy into a force that can be used against the masters themselves.");
quest::summonitem(120240);
quest::assigntask(17);
quest::delglobal("Djinnseven");
quest::setglobal("Djinneight", 1, 5, "F");
}
elsif ($text=~/Hail/i && $qglobals{"Djinnone"} == 1) {
quest::say("You have business with my brother Driya to complete $name, I am too busy to help you right now.");
}
elsif ($text=~/Hail/i && $qglobals{"Djinntwo"} == 1) {
quest::say("You have business with my brother Driya to complete $name, I am too busy to help you right now.");
}
elsif ($text=~/Hail/i && $qglobals{"Djinnthree"} == 1) {
quest::say("You have business with my brother Baein to complete $name, I am too busy to help you right now.");
}
elsif ($text=~/Hail/i && $qglobals{"Djinnfour"} == 1) {
quest::say("I have nothing more for you to do $name, You have business with my brother Baein to complete. I am too busy to help you right now.");
}
elsif ($text=~/Hail/i && $qglobals{"Djinnfive"} == 1) {
quest::say("I have nothing more for you to do $name, You have business with my brother Baein to complete. I am too busy to help you right now.");
}
else {
quest::say("I do not believe you have spoken to Lord Drizku yet $name.");
}
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount,120239 => 1)){ #Signet of Chaos
quest::say("Well Done $name, With the generals now defeted it is time for the final battle to reclaim our temples. Take this as proof of what you have accomplished, It is the Key to the Chamber of Chaos. Your skills will never be as needd as they are now.");
quest::summonitem(120238);
quest::delglobal("Djinneight");
quest::setglobal("Djinnnine", 1, 5, "F");
}
else {
    $client->Message(14,"$name, I don't need this. Take it back."); #return bogus items
    plugin::return_items(\%itemcount);
    return 1;
  }
}
