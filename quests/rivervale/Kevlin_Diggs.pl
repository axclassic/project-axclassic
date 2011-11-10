#############
#NPC: Kevlin_Diggs
#Quest Name: 
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Mangler
#Items Involved:
#zone: rivervale

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Greetings. $name! Welcome to my shop! We have many fine wares. The Diggses of Rivervale have always supplied halflings and travelers with the finest armor. I advise you to purchase armor only from Kevlin's Gear and not to be conned into buying from Sonsa Fromp.");
  }
  elsif($text=~/wh(o|at) is Mangler/i) {
    quest::say("Mangler is my guard dog. I have had him since he was a pup. You had best stay far away from him - he doesn't like stangers. and don't even think about hurting him or I will KILL you. You got that?! Good. Did you have some shopping to do or did you just come here to talk about my dog?");
  }
  elsif($text=~/who is Sonsa/i) {
    quest::say("I used to be wed to Sonsa Fromp. She shamed the Diggs name by cheating my customers. She would charge my customers double! I am sure she is still doing the same, but it is done without the Diggs name. Good riddance!");
  }
  elsif($text=~/what is Kevlin's gear/i) {
    quest::say("Kevlin's Gear is a good place to find armor if you plan on venturing into Kithicor Forest or the Misty Thicket. If you need it, it is located next to the Fools's Gold");
  }
  elsif($text=~/who is Twippie/i) {
    quest::say("Twippie Diggs is my youngest sibling. He handles all the sales of leather armor.");
  }
  elsif($text=~/who is Meeka/i) {
    quest::say("Meeka Diggs is my youngest sister. She is also in the family business. She deals with all the cloth armor.");
  }
  elsif($text=~/who is Lashinda/i) {
    quest::say("Ahh.. Lashinda.. She is my new love. She works over at the Fool's Gold");
  }
}

sub EVENT_SIGNAL {
  # event_signal from Mangler to continue dialog
  if ($signal == 1) {
    quest::say("Settle down there, [Mangler]..  Hey!  I told you to stay off of that table!");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
  quest::say("I have no need for this $name, you can have it back.");
}

#END of FILE Zone:rivervale  ID:19049 -- Kevlin_Diggs 

