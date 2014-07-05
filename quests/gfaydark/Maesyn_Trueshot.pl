######################################
## NPC: Maesyn Trueshot             ##
## Zone: Gfaydark                   ##
##  Ranger Guildmaster note turnin  ##
##       Trueshot Longbow           ##
## Revised by caved for AXClassic   ##
## EQWorld Server     03-01-2011    ##
######################################
sub EVENT_SAY {
my $trueshot = quest::saylink("Trueshot", 1);
my $gather = quest::saylink("gather", 1);
my $correct = quest::saylink("correct", 1);
my $incarnation = quest::saylink("incarnation", 1);
  if($text=~/hail/i) {
    $client->Message(14,"Welcome to Kelethin, $name! I am Maesyn Trueshot, commander of Faydark's Champions. We are the finest marksmen in all of Norrath. With our trusty $trueshot longbows we can miss no target regardless of the distance or the conditions.");
  }
  elsif($text=~/trueshot/i) {
    $client->Message(14,"The Trueshot Longbow was created by my famed father. Eldin Trueshot. It is quite accurate and takes a ranger's skill to wield. We use our new recruits to $gather materials needed by my father. We shall soon begin to release the formula to good elves so all may fletch such a bow.");
  }
  elsif($text=~/gather/i) {
    if($faction < 5) { #Needs better than indifferent
      $client->Message(14,"Take this pack. Go to Kaladim, find Trantor Everhot and ask for dwarven wire. Then go to Freeport to meet Jyle Windshot. Search the inns for him and ask him for treant wood. Then, collect some spiderling silk from spiderlings and finally, in Steamfont, we have the permission of the gnomes to use any micro servos we find while destroying rogue spiders. Combine them all and return the pack to me.");
      quest::summonitem(17951); #Material Pack
    }
    else {
      $client->Message(14,"Faydark's Champions cannot call you foe, but you have yet to earn our trust.");
    }
  }
  elsif($text=~/correct/i) {
    $client->Message(14,"Now that I have crafted the Treant Bow Staff, you shall need one Planing Tool, one Treant Bow Staff, one Micro Servo and one spool of Dwarven Wire. These items will be used with your Fletching Kit as all other bows. Be forewarned, only a Master Fletcher can create such a bow and even a master fails from time to time. Good Luck. If you feel you don't have the skill for this, hand me the items and I will make the combine for you.");
  }
  elsif($text=~/incarnation/i) {
    $client->Message(14,"The Trueshot Longbow was once enchanted by the Koada'Dal enchanters.  Once it was enchanted now it is no more. I am sure if you were ask the Koada'Dal [where the enchanted bows] are you will get an answer.");
  }
}

sub EVENT_ITEM {
my $correct = quest::saylink("correct", 1);
my $incarnation = quest::saylink("incarnation", 1);
  if ((plugin::check_handin(\%itemcount, 8091 => 1)) && (plugin::check_handin(\%itemcount, 8086 => 1))
    && (plugin::check_handin(\%itemcount, 12113 => 1))&& (plugin::check_handin(\%itemcount, 12111 => 1))){
    quest::summonitem(8401); #Trueshot Longbow 
    $client->Message(14,"Enjoy your bow!");
  }
  elsif (plugin::check_handin(\%itemcount, 12112 => 1)) { #Pack of Materials
    $client->Message(14,"I shall see that my father gets the materials. I hope this can be of use to you. It will serve as your starting point toward fletching a Trueshot longbow. It is unfortunate that we are unable to enchant the bow to its next $incarnation, but it is still a fine weapon. You do know the $correct components needed for fletching such a bow, do you not?");
    quest::givecash(0,6,0,0); #6 gold
    quest::summonitem(8091); #Treant Bow Staff
    quest::faction(99,10); #Faydark's Champions
    quest::faction(178,10); #King Tearis Thex
    quest::faction(43,10); #Clerics of Tunare got better. 
    quest::faction(304,10); #Soldiers of Tunare got better. 
    quest::faction(63,-10); #Crushbone Orcs got worse. 
  }
  elsif (plugin::check_handin(\%itemcount, 18785 => 1)) { #A tattered note
    $client->Message(14,"Hail, $name, and welcome.. I am Maesyn Trueshot, leader of Faydark's Champions. I will teach and train you, as I have done for many others. Let's get started.. Here, put this on.. it'll help protect you from the elements. Once you are ready to begin your training please make sure that you see Samatansyn Flamecaller, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various trades you will have available to you.");
    quest::faction(99,10);  # Faydark's Champions
    quest::faction(178,10); # King Tearis Thex
    quest::faction(43,10);  # Clerics of Tunare
    quest::faction(304,10); # Soldiers of Tunare
    quest::faction(63,-30); # Crushbone Orcs
    quest::ding();
	quest::exp(1000); 
    quest::summonitem(13536); # Dirty Green Tunic* 
	quest::rebind(54,521,-450,118);
  }
       else {
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
}

