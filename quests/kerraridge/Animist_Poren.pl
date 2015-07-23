sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings $name. it is good to see you. If you have come for the first stage of Khati Sha training please show me your acrylia slate."); }
}
if($text=~/forged/i){
quest::say("Visit my old friend Kagazz, he can instuct you on how to make the fasteners.");
}
}
sub EVENT_ITEM { 
my $forged = quest::saylink("forged", 1);
if (plugin::check_handin(\%itemcount, 2877 =>1 )) {
quest::say("I have much for you to do $name. There is great need for capable Khati Sha in this new land. It is important that you progress speedily. We need to outfit you with the equipment that defines our chosen path. Well start with your battleclaws... But be aware of the fact that it will take you some time before can use both sets in combat.  Just keep them both with you while you learn.");
quest::say("Take this stitching pack and combine two shade silks from the xakra worms. Combine two of the resulting threads to make a bandage. Take this pattern and sew together three of the bandagesin a sewing kit or use a loom. With considerable practice this will produce the handwraps that will be a foundation for your first sacred weapon. When you have created them return to me the scrap material.");
quest::summonitem(2877);
quest::summonitem(3663);
quest::summonitem(17237);
} 
elsif (plugin::check_handin(\%itemcount, 3665 =>1 )) {
quest::say("Well done $name, you are ready to conimue your training.");
quest::say("The next piece you need to create is a your Khati Sha recruit claws.");
quest::say("Combine in your Stiching Pack the handwraps you made earlier, two young hopperclaws and some $forged fasteners. This will create your first level sacred weapons.");
}
elsif (plugin::check_handin(\%itemcount, 3673 =>1, 3674 =>1, 2878 =>1 )) {
quest::say("My dear friend, $name, you have been a wonderful student! Though we have not had an opportunity to work on the more refined Khati Sha teachings, you have definitely proven yourself to be an honorable citizen and worthy apprentice. Here is your cloak. Please take it along with the title of Khati Sha Apprentice.");
    quest::shout("Everyone, please welcome my student and friend, $name, to the rank of Khati Sha Apprentice!");
    quest::say("Now, please meet with Animist Mahron Sood. He will be responsible for your the next phase of your training. Show him my seal that I just gave you. Take care, friend!");
quest::summonitem(3673);
quest::summonitem(3674);
quest::summonitem(3675);
quest::summonitem(3670);
}
else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
  plugin::return_items(\%itemcount);
}
}
#END of FILE Zone:sharvahl  ID:155073 -- Animist_Poren 

