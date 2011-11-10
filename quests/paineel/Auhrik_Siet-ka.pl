sub EVENT_SAY { 

if($text=~/Hail/i){
quest::say("Hello.  Do you need something or did you merely wish to grace me with your oh-so-delightfully perfumed breath?"); }

if($text=~/understand common/i){
quest::say("Of course you do.  Now. listen carefully.  It may be too much for your feeble mind to gather all at once. and I hate to repeat myself.  Bring me one bat wing. one rat ear. one snake egg. and one fire beetle eye.  Take this bag. and make sure it's sealed before you return it to me.  Snake eggs spoil.  Now. quit staring at me with your jaw hanging open like a dead codfish.  I would have mistaken you for one. but dead codfish smell better. Haha!");
      quest::summonitem("17802");

 }
}
sub EVENT_ITEM { 

    if (plugin::check_handin(\%itemcount, 14041 => 1)) {
quest::say("Why are you giving this to me?  Oh I see.  I forgot that rats don't know how to read. Haha!  Well. then. I shall read it for you. You do [understand common] don't you? Haha."); 
    }


    if (plugin::check_handin(\%itemcount, 12993=>1)) { #Small Sealed Bag (from recipe)
      quest::emote("smells bag expecting a stench.");
      quest::say("Well, at least you can do something worth the air you breathe. Now go haunt someone else. Perhaps a kobold needs you to clean its fur.");
                          # Happy Sound (FanFare)
       quest::ding(); quest::exp(1000);                 # Experience
      quest::givecash("8","6","1","0"); # Cash
      quest::faction("143","5");        # Heretics
      }
      
   else {
    quest::say("I have no need for this.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:paineel  ID:75090 -- Auhrik_Siet`ka 

