##High Archon Baein Udersith 211488##
sub EVENT_SAY {
my $captains = quest::saylink("captains", 1);
my $chance = quest::saylink("chance", 1);
my $willing = quest::saylink("willing", 1);
if ($text=~/Hail/i && $qglobals{"Djinnfive"} == 1) {
quest::say("It is about time you got here $name, Things are taking a turn for the worst. We have heard rumors that with the demolishing of the armies of Chaos, the $captains have been seen lurking around lately.");
}
elsif ($text=~/captains/i && $qglobals{"Djinnfive"} == 1) {
quest::say("Indeed, these creatures are the first hands to their masters and are not the most forgiving beings we have had to deal with. Their powers and abilities will challenge even the greatest of warriors. Perhaps if you gather your forces you could stand a $chance.");
}
elsif ($text=~/chance/i && $qglobals{"Djinnfive"} == 1) {
quest::say("Hmmm I see, well since you have your force with you, it should work in your favor but, be careful as well. These beings are rumored to possess great strength.");
quest::say("Also take this container, if you manage to defeat the five captains, place thier hearts in this box, combine them and return it to me. Our Lead Researcher is looking into a way to use their powers of Chaos against itself.");
quest::summonitem(120226);
quest::assigntask(16);
quest::delglobal("Djinnfive");
quest::setglobal("Djinnsix", 1, 5, "F");
}
elsif ($text=~/Hail/i && $qglobals{"Djinnthree"} == 1) {
quest::say("You have business with my brother Driya to complete $name, I am too busy to help you right now.");
}
elsif ($text=~/Hail/i && $qglobals{"Djinnfour"} == 1) {
quest::say("You have business with my brother Driya to complete $name, I am too busy to help you right now.");
}
elsif ($text=~/Hail/i && $qglobals{"Djinnsix"} == 1) {
quest::say("You have business with my brother Drizmun to complete $name, I am too busy to help you right now.");
}
elsif ($text=~/Hail/i && $qglobals{"Djinnseven"} == 1) {
quest::say("You have business with my brother Drizmun to complete $name, I am too busy to help you right now.");
}
elsif ($text=~/Hail/i && $qglobals{"Djinneight"} == 1) {
quest::say("You have business with my brother Drizmun to complete $name, I am too busy to help you right now.");
}
else {
quest::say("I do not believe you have spoken to Lord Drizku yet $name.");
}
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount,120225 => 1)){ #Signet of the Compliance
quest::say("Well Done $name, it is good news to hear that you put such a damper in the forces of Chaos. Speak to my Brother Drizmun, he requires your assistance on some grander mission.");
quest::delglobal("Djinnfive");
quest::setglobal("Djinnsix", 1, 5, "F");
}
else {
    $client->Message(14,"$name, I don't need this. Take it back."); #return bogus items
    plugin::return_items(\%itemcount);
    return 1;
  }
}