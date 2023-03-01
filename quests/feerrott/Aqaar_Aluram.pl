# Aqaar_Aluram

sub EVENT_SAY {
    my $Pass = quest::saylink("passing through", 1);
    my $Temple = quest::saylink("temple", 1);
    my $Expedition = quest::saylink("expedition", 1);
    my $Night = quest::saylink("night", 1);
    my $Visions = quest::saylink("visions", 1);
    my $Ooze = quest::saylink("ooze", 1);
    my $Happened = quest::saylink("happened", 1);
    my $Phobonomicon = quest::saylink("Phobonomicon", 1);
    if($text=~/Hail/i) {
        quest::say("Hail traveler. may I assist you with something. or are you just $Pass?");
    }
    if($text=~/passing through/i) {
        quest::say("Very well friend. please take care when passing beyond the river to the east.  Several researchers and their mercenary escort passed through our camp en route to the $Temple.  That was last week and they have yet to return.  We are holding off on our $Expedition until we can learn more about what $Happened to them.");
    }
    if($text=~/temple/i) {
        quest::say("The temple of the lizardmen. The lost temple of Cazic-thule. It's just to the east of here.. across the river.");
    }
    if($text=~/expedition/i) {
        quest::say("Several weeks ago, I received the news from M'lady Morkul that the Academy was researching this temple. It had been years since I last visited this site, so naturally I was interested. Of course, that was before we set camp in this accursed place. I must be honest; I was quite ready to leave after our first $Night here.");
    }
    if($text=~/night/i) {
        quest::say("After securing the site, we set sentinels to alert us to any patrols or prying jungle eyes. Unfortunately, our magic did little to provide us with a night's rest that eve. The incessant sound of drums and the screams from within the temple had little regard for our lack of rest and already nervous disposition. Several times during the course of my slumber that night, I was taunted by foul $Visions of an unnatural sort.");
    }
    if($text=~/visions/i) {
        quest::say("My mind was filled with images of grotesque rituals. The lizards that inhabit that place were gathered around magical portals, chanting in a tongue too wretched to recall. As they spoke and danced, the denizens of some horrid void were pouring from the shimmering rifts! I awoke to find the others in the same state of horror! When I gathered my senses, I noticed that all of our equipment has been covered in some sort of black $Ooze, though our sentinels displayed no signs of having been triggered.");
    }
    if($text=~/ooze/i) {
        quest::say("I really cannot recall much about the ooze. We have noticed that our memories seem to be affected by this place as well. I know that the ooze was present when we awoke, but it seemed to have been absorbed into the ground. It moved on its own volition. That is all that I can recall.");
    }
    if($text=~/happened/i) {
        quest::say("There was a story that floated about when I was a student. In summary, there was a tome of similar nature to the $Phobonomicon. An ambitious mage recovered the tome from the possession of several faceless creatures in the Abysmal Sea. This mage reportedly went quite insane. The story claims that his last act of madness was to cast the tome into a living rift of matter. The rift then opened and released a creature of an unspeakable nature. This cured the mage of his problems... for good. That is why you should return all items of that sort to me.");
    }
    if($text=~/Phobonomicon/i) {
        quest::say("A Phobonomicon, book of fear, is rumored to be creatable through the use of rituals and tools too disturbing to describe. Once the ritual or process is complete, the book will begin to take on its own... life, for lack of a better word. The book of fear is capable of unthinkable magic. Watch yourself, should you stumble into such a tome.");
    }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 8720 => 1)) { # Medallion of the Arcane Scientists
      quest::say("Thank You! This is most interesting. I must study it immediatly. Here have this as thanks.");
      quest::summonitem(8732);
      quest::ding();
	  quest::exp(100000);
   }
}
#END of FILE Zone:feerrott  ID:47132 -- Aqaar_Aluram 

