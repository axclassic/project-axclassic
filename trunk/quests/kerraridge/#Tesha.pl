#NPC: #Tesha   Zone: Kerraridge
#by Qadar

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Oh, hello there $name.  Is there anything I can do for you?  Or perhaps you are seeking to [assist] me??");
  }
  if($text=~/assist/i){
    quest::say("We are in need of help.  Apparantly there is some trouble brewing in Toxxulia Forest.  An [exiled kerran] is up to something...");
  }
  if($text=~/exiled kerran/i){
    quest::say("We were forced to banish a kerran named Ferik from this city.  He was involved in some [arts] that we do not approve of.");
  }
  if($text=~/arts/i){
    quest::say("Ferik became obsessed with Necromancy.  That is a practice we cannot tolerate in this city.  Although he denies this, we have good reason to suspect his involvement.  We gave him a fair number of warnings before banishing him.  Now we hear he is in Toxxulia plotting his [revenge]");
  }
  if($text=~/revenge/i){
    quest::say("What he is planning, we do not know.  Maybe you can find him and help us spy on his activities.  When he was exiled, he escaped with a journal.  If we had this, I am sure we could find out what is up to. Be careful though, we have reports of him lurking near the river, where some powerful enemies also reside.");
  }
}

sub EVENT_ITEM{                                                   #if you hand in Ferik's journal
  if(plugin::check_handin(\%itemcount, 105 => 1)){
    quest::say("AHA!  You have done it!  We now know the true nature of his plans!  He has a truly dark and evil mind indeed!  All of the Kerrans appreciate your efforts to protect our great city!  Take this as a reward!");
    #quest::summonitem(1000);
    quest::faction(132,15);   # Guardians of Shar Val better
    quest::faction(175,15);   # Kerra Isle better
     quest::ding(); quest::exp(1030);
    quest::ding;
     my $random_result = int(rand(105));
      if($random_result<=25){
        quest::summonitem(128); #Karana Moonstone
      }elsif($random_result<=50){
        quest::summonitem(126); #Commons Moonstone
      }elsif($random_result<=75){
        quest::summonitem(133); #Ro Moonstone
      }elsif($random_result<=100){
        quest::summonitem(125);} #Gfay Moonstone
  }elsif(plugin::check_handin(\%itemcount, 600 => 1)){            #if you hand in only the missing pages from Ferik's journal
    quest::say("Well, I do commend your work.  These pages are definitely a good start.  However, it is not quite nearly enough.  Take these back for now, and please find something more to show us what he is planning.");
    quest::summonitem(105);
  }else{
    plugin::return_items(\%itemcount);
  }
}

