################################### 
#Zone: Ak`Anon                    #                                              
#Short Name: akanon               #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Tobon_Starpyre         #                             
#NPC ID: 55130                    #
#Quest Status: Complete           #                                      
###################################
sub EVENT_SAY {
my $curious = quest::saylink("curious", 1);
my $Collective = quest::saylink("Collective", 1);
my $mission = quest::saylink("mission", 1);
my $yendar = quest::saylink("yendar", 1);
my $trades = quest::saylink("trades", 1);
my $Books = quest::saylink("Books", 1); 
  if($text=~/Hail/i) {
    quest::say("It is good to see the young show an interest in the ways of magic. Its circles can be used in tandem with our unique ways of tinkering. Have you [joined the Eldritch Collective] or are you [merely curious]?");
 }
  if($text=~/curious/i) {
    quest::say("Please look around. We have much knowledge within these halls. May you soon find your place among our members. Good day.");
 }
  if($text=~/Collective/i) {
    quest::say("Very good. Would you like to [go on a little mission] or are you busy studying?");
 }
  if($text=~/mission/i) {
    quest::say("Fabulous! Here is a list of the observers outside of Ak'Anon. Go and ask each for a [spare telescope lens]. Each should give you one. We have need of them.  I await your return as does your reward, either Fire Bolt or Fingers of Fire.  Meant for a skilled wizard of the eighth trial.");
    quest::summonitem("18868");
 }
  if($text=~/yendar/i) {

    quest::say("Oh, he is my older brother. Used to be the leader of the Eldritch Collective. Then he founded the Observers, a pretty good piece of work. Went off his rocker a long while back, though. Became obsessed with Innoruuk and the Teir'Dal. Stays away for days at a time, nobody knows where he has been. Mother still worries about him, asked me to keep an eye on him. But he is a grown gnome, and with his mastery of the art, has little to fear in this world or others. But if you are seeking him, I would look outside Ak'Anon, in the Steamfonts. That is where he makes his home these days.");
 }
 if($text=~/trades/i) {

    quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
    quest::summonitem("51121");
 }
 if($text=~/book/i) {
    quest::say("Here is the second volume of the book you requested, may it serve you well!");
    quest::summonitem("51122");
 }
}

sub EVENT_ITEM { 
my $trades = quest::saylink("trades", 1);
  if($itemcount{18774} == 1) { #Registration Letter
    quest::say("Ah..  Welcome, friend!  I am Tobon Starpyre, Master Wizard of Library Mechanimagica.") ;
	quest::say("This is our tunic - wear it with pride.  Study hard, master your skills, and make us proud. Once you are ready to begin your training please make sure that you see Xalirilan, he can assist you in developing your hunting and gathering skills.") ;
    quest::say("Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various $trades you will have available to you.");
    quest::summonitem(13523); #Soot Stained Gold Robe*
    quest::ding();
	quest::faction(91,10); #Eldritch Collective
    quest::faction(115,10); #Gem Choppers
    quest::faction(176,10); #King Ak'Anon
    quest::faction(210,10); #Merchants of AkAnon
    quest::faction(71,-10); #Dark Reflection
    quest::faction(322,-10); #The Dead
    quest::exp(1000);
 }
  else
    {
	#Do all other handins first With plugin, then let it Do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Wizard');
    quest::say("I have no use for these $name.");
    plugin::return_items(\%itemcount);
    }
 }

