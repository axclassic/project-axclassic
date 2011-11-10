sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings $name. it is good to see you. If you have come for the first stage of Khati Sha training please show me your acrylia slate."); }
}
sub EVENT_ITEM { 
if($itemcount{2877} == 1){
quest::say("I have much for you to do $name. There is great need for capable Khati Sha in this new land. It is important that you progress speedily. We need to outfit you with the equipment that defines our chosen path. Well start with your battleclaws... But be aware of the fact that it will take you some time before can use both sets in combat.  Just keep them both with you while you learn.");
quest::say("Take this stitching pack and combine two shade silks from the xakra worms. Combine two of the resulting threads to make a bandage. Take this pattern and sew together three of the bandages. With considerable practice this will produce the handwraps that will be a foundation for your first sacred weapon. When you have created them return to me the scrap material.");
quest::say("I have much for you to do $name. There is great need for capable Khati Sha in this new land. It is important that you progress speedily. We need to outfit you with the equipment that defines our chosen path. We'll start with your battleclaws... But be aware of the fact that it will take you some time before can use both sets in combat.  Just keep them both with you while you learn.");
quest::say("Take this stitching pack and combine two shade silks from the xakra worms. Combine two of the resulting threads to make a bandage. Take this pattern and sew together three of the bandages. With considerable practice this will produce the handwraps that will be a foundation for your first sacred weapon. When you have created them return to me the scrap material.");
quest::summonitem("2877");

} else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
  plugin::return_items(\%itemcount);
}
}
#END of FILE Zone:sharvahl  ID:155073 -- Animist_Poren 

