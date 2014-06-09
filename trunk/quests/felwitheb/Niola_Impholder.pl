#
#
#
#
#Threeflies  - added saylink



sub EVENT_SAY {

my $fetch = quest::saylink("fetch");

   if($text=~/Hail/i) {
      quest::say("Greetings, $name . Welcome to the home of the Keepers of the Art. I am in need of spell components. Would you be willing to $fetch some for me?");
   }
   if($text=~/fetch/i) {
      quest::say("What I need are some bat wings for a spell I am researching. If you bring me back four bat wings, I would be willing to reward you with a scroll.");
   }
}

sub EVENT_ITEM {
   if($itemcount{13068} == 4)
   {
      quest::say("Ah yes.  These are exactly what I need.  Thank you very much.");
      quest::summonitem(15310);
      quest::faction(170, 4); #Keepers of the Art
      quest::faction(178, 4); #King Tearis Thex
      quest::faction(99, 4); #Faydarks Champions
      quest::faction(322, -4); #The Dead
      quest::ding();
      quest::exp(350);
   }
   elsif($item1 == 18777) {
      quest::say("Welcome. I am Niola Impholder. Master Magician of the Keepers of the Art. Here is our guild robe. You have much to learn. so let's get started.");
      quest::summonitem(13592);
      quest::ding();
	  quest::faction(170, 10); #Keepers of the Art
      quest::faction(178, 10); #King Tearis Thex
      quest::faction(99, 10); #Faydarks Champions
	  quest::faction(322, -30); #The Dead
      quest::exp(100);
   }
   elsif($item1 == 18902) {
      quest::say("She is still alive? OH, thank you for this news.");
      quest::summonitem(1307);
      quest::ding();
	  quest::exp(30000);
   }
   else {
      quest::emote("will not take this item.");
      plugin::return_items(\%itemcount);
   }
}

#END of FILE Zone:felwitheb  ID:62021 -- Niola_Impholder 

