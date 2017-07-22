##Arch_Mage_Driya_Vircun 211187##
sub EVENT_SAY {
my $best = quest::saylink("best", 1);
my $fallen = quest::saylink("fallen", 1);
my $willing = quest::saylink("willing", 1);
if ($text=~/Hail/i && defined $qglobals{"Djinntwo"}) {
quest::say("Ah I see the Protectors of Norrath have finally come to lend a hand, well your timing is not the $best I am afraid.");
quest::delglobal("Djinntwo");
quest::setglobal("Djinnthree", 1, 5, "F");
}
elsif ($text=~/Hail/i && defined $qglobals{"Djinnfour"}) {
quest::say("I have nothing more for you to do $name, You have business with my brother Baein to complete. I am too busy to help you right now.");
}
elsif ($text=~/Hail/i && defined $qglobals{"Djinnfive"}) {
quest::say("I have nothing more for you to do $name, You have business with my brother Baein to complete. I am too busy to help you right now.");
}
elsif ($text=~/Hail/i && defined $qglobals{"Djinnsix"}) {
quest::say("I have nothing more for you to do $name, You have business with my brother Drizmun to complete. I am too busy to help you right now.");
}
elsif ($text=~/Hail/i && defined $qglobals{"Djinnseven"}) {
quest::say("You have business with my brother Drizmun to complete $name, I am too busy to help you right now.");
}
elsif ($text=~/Hail/i && defined $qglobals{"Djinneight"}) {
quest::say("You have business with my brother Drizmun to complete $name, I am too busy to help you right now.");
}
elsif ($text=~/best/i && defined $qglobals{"Djinnthree"}) {
quest::say("As you already know, we have been driven from our sacred temples and have taken refuge here on the out skirts of our realm. However, we will never accept defeat in the face of Chaos and will not stop our attemps to reclaim our realm until the last living Djinn has $fallen in combat.");
}
elsif ($text=~/fallen/i && defined $qglobals{"Djinnthree"}) {
quest::say("We have already lost a number of our members, and many more have fallen into the shadows of corruption weaved by the Master of Chaos. If you are $willing to lend a hand, we could use your strength in reclaiming our temples.");
}
elsif ($text=~/willing/i && defined $qglobals{"Djinnthree"}) {
quest::say("Very well, I have a task for you $name.");
quest::assigntask(15);
quest::say("Once you  have completed this task, return to me with proof of your deeds for further instructions on how you may assist the Djinn.");
quest::delglobal("Djinnthree");
quest::setglobal("Djinnfour", 1, 5, "F");
}
else{
quest::say("I do not believe you have spoken to Lord Drizku yet $name.");
}
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount,120224 => 1)){ #signet of the djinn
quest::say("Well Done $name, it is good news to hear that you put such a damper in the forces of Chaos. Speak to my brother Baein he requires your assistance on some grander mission.");
quest::delglobal("Djinnfour");
quest::setglobal("Djinnfive", 1, 5, "F");
}
else {
    $client->Message(14,"$name, I don't need this. Take it back."); #return bogus items
    plugin::return_items(\%itemcount);
    return 1;
  }
}