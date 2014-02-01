#############
#NPC: Micc_Koter ID:1072
#Quest Name: Paw of Opolla
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Klieb_Torne, Caninel
#Items Involved: Brandy ID:13034
#zone: qeynos

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Oh, hello, $name. Don't mind my associate Klieb over there. He gets quite grumpy when he drinks. We are relatively new here ourselves but have made some fast friends in Qeynos. This is a city of opportunity.");
	#checking to see if Klieb_Tome is spawned and send signal
	my $npccheck = $entity_list->GetMobByNpcTypeID(1071);
    if ($npccheck != 0) {
    quest::signalwith(1071, 1, 2);
    }
  }
  elsif($text=~/what.*?gnoll/i){
    quest::say("A gnoll is a stupid dog that walks upright. They are dirty and stinky and hate humans. Just like my pal Klieb here. Heh!");
  }
  elsif($text=~/what paw/i){
    quest::say("Some guy, don't know who he was, was in here claiming he had a lead on a place to find some information on the Paw of Opolla. I don't know anything about it except it is supposed to be the paw of some old gnoll and to have some magic powers. Buy me a brandy and I might tell you where he was going.");
  }
  elsif($text=~/what ranger/i){
    quest::say("Beats me. Try going to the north near Surefall Glade. That is where those goody-goodies tend to hang out.");
  }
}

sub EVENT_ITEM {
  #Brandy ID:13034
  if(plugin::check_handin(\%itemcount, 13034 => 1)){
	if (!defined($qglobals{"flask"})){
	  quest::setglobal("flask", 0, 0, "H1");
	}
	if ($qglobals{"flask"} == 0){
      #First hand-in
	  quest::say("Hey.. Better get me another one.. I can't quite remember.. Heh heh..");
	  quest::setglobal("flask", 1, 0,"H1");
	}
	elsif($qglobals{"flask"} == 1){
	  #Second hand-in
	  quest::say("Oh, yes. Now I remember.. Ha ha.. He said he was going into the plains of Karana to look for some gnoll lover by the name of Caninel. He said Caninel knew something about the location of the Paw of Opolla. it sounds like a bunch of rat crap to me. I never heard of no one named Caninel. But off he went.. Heck, finding one person in the Plains of Karana without a [ranger] to guide you is like looking for a clean spot on ol' Klieb here. Ha ha!!");
	  quest::ding(); quest::exp(200);
	  quest::delglobal("flask");
	}
  }
  else {
    quest::emote("I have no need for this $name, you can have it back.");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_SIGNAL {
  #response to Klieb_Tome
  if ($signal == 1) {
    quest::say("Lighten up, will ya, Klieb?! You act like a dang [gnoll] sometimes..");
  }
  #response to Klieb_Tome
  elsif ($signal == 2) {
    quest::say("Ha ha ha ha!");
  }
}

#END of FILE Zone:qeynos  ID:1072 -- Micc_Koter 


