##Cleet_Miller_Jr ID 12029 West Karana qey2hh1
sub EVENT_SAY { 
my $corn = quest::saylink("corn", 1);
    if($text=~/Hail/i && defined $qglobals{"Thankscorn"} == 1) {
       quest::emote(' grumbles and looks up at you.'); 
	   quest::say("Cant you see I am busy? What is it you want $name? Did the Glumrs send you for $corn?");
	   }
	elsif($text=~/corn/i && defined $qglobals{"Thankscorn"} == 1) {  
        quest::say("We heard that eerie	sound also but it didnt effect us, that we can tell.");
		quest::say("It is a bit late in the season, but take this, I hope its enough.");
		quest::say("I think you need to talk to Old Lady Einarr in North Karana, she may have information as to what is going on.");
		quest::summonitem(120331);
		quest::delglobal("Thankscorn");
		quest::setglobal("Thankslady", 1, 5, "F");
         }
	elsif($text=~/Hail/i && defined $qglobals{"Thanksdead"} == 1) {
       quest::emote(' grumbles and looks up at you.'); 
	   quest::say("So not as easy as you thought $name? I guess you want more $corn?");
	   }
	elsif($text=~/corn/i && defined $qglobals{"Thanksdead"} == 1) {
       quest::say("OK, I scraped up a few mor kernels for you, you better succeed this time. Return to Corny Scarecrow talk to him and hand him these.");
	   quest::delglobal("Thanksdead");
        quest::setglobal("Thanksreturn", 1, 5, "F");
		quest::summonitem(120331);
	   }
         else {
            quest::emote(' grumbles and looks up at you.'); 
        }
    } #END of FILE Zone:qey2hh1  ID:626 -- Cleet_Miller_Jr 