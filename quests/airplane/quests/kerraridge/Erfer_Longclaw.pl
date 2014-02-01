#NPC: Erfer_Longclaw   Zone: Kerraridge
#by Qadar

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Hello $name.  You like fish?  Look like good day for fish!");
  }
  if($text=~/journal/i){
    quest::say("You know about Ferik?  I tell you.  Ferik do bad things.  Ferik try to escape, Elders say to get his book.  I try to take book, but some pages rip out.  I still have pages but I not read anyways.  You can have if you pay [fee].");
  }
  if($text=~/ferik/i){
    quest::say("You know about Ferik's book?  I tell you.  Ferik do bad things.  Ferik try to escape, Elders say to get his book.  I try to take book, but some pages rip out.  I still have pages but I not read anyways.  You can have if you pay [fee].");
  }
  if($text=~/fee/i){
    quest::say("Yes, fee.  I don't need pages.  I need tasty fish.  If I have 1 platinum, I can buy lots of tasty fish.  You give me money, I give you pages.  You think good deal?");
  }
}

sub EVENT_ITEM{             #Erfer trades you the pages of Ferik's journal for 1 plat
  if($platinum>=1){
    quest::say("Ah, Erfer thank you.  You get old papers, Erfer get to buy tasty fish.");
    quest::summonitem(600);
  }
  plugin::return_items(\%itemcount);
}
