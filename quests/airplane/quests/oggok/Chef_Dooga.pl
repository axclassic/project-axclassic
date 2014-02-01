sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome you. $name.  You look all skin 'n bones.  Eat you must do.  Chef Dooga can fix up goodies for you.  Try [HEHE meat] or [pickled frogloks].");
}
if($text=~/HEHE meat/i){
quest::say("It is a secret ground meat made with high elf. human and Erudite Flesh.  Mmmm.  It good stuff.  Dooga make it and [the Gobbler] make it.  If you find any of those meats in the swamps bring to me and I pay you.");
}
if($text=~/pickled frogloks/i){
  quest::say("It takes a fine palate to really savor pickled frogloks. They're not hard to make though; in fact, you could make some.  They won't be as good as Chef Dooga's...that's why I'm the chef.  But you can try.");
  quest::emote("licks her lips.");
  quest::say("They're made by combining froglok meat, vinegar, and sauce in an oven.  I can almost smell 'em now.  Go bring me three of them, and I'll make you almost a chef too.");
  }
if(($text=~/the gobbler/i) && ($faction<=5)){
quest::say("You no hear of the Gobbler!!  Him great butcher.  Have all kinds of meat.  Him am low on froglok legs. Dooga supply him.  Dooga need someone to [deliver froglok legs].");
}

if($text=~/deliver froglok legs/i){
quest::say("You think so!!  That be good thing.  Make the Gobbler happy.  Maybe he give you something good.  Maybe not.  You take this.  Deliver meat.");
quest::summonitem(13384);
}
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 13364 => 1, 21964 => 1, 13365 => 1)) { #Human Flesh, Erudite Meat, & High Elf Flesh
  quest::say("Wait right here. I make you delicious HEHE meat.");
  quest::summonitem(13368);
  quest::say("HEE HEE! Delicious it is! HEE HEE! Nutritious, perhaps! HEE HEE!........");
  quest::ding();
  }
elsif (plugin::check_handin(\%itemcount, 13452 => 3)) {
quest::emote("gobbles down 3 jars of pickled froglok meat before your eyes.");
quest::say("Sorry...none for you, but you don't mind. I'm Chef Dooga!");
quest::ding();
quest::exp(350);
quest::faction(46,10);
quest::faction(57,1);
quest::faction(232,5);
quest::faction(128,1);
quest::summonitem(12217);
}
}
#END of FILE Zone:oggok  ID:49061 -- Chef_Dooga 

