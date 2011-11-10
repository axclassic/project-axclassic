#npc - Hetina Miller
#zone - West Karana
#reward - money, exp, faction

sub EVENT_SAY
{
 if($text=~/Hail, $mname/i)
  {
   quest::say("Hullo there. What brings you to the Miller Farm?");
  }
 if($text=~/what grains do you grow/i)
  {
   quest::say("We grow all sorts of grains here, but there is a difference between crops and grains. Crops can be anything that is harvested for sell. While a grain is a specific type of crop. I have just gotten done baggin up the grain from our latest crop. The bags are laying out in the field. However, I am exausted from all this work, I would be willing to pay if you would drag these bags in for me. Will you help me drag the grain in?");
  }
 if($text=~/no/i)
  {
   quest::emote("sighs.");
   quest::say("Well, I'll just be getting back to work.");
  }
 elsif($text=~/yes/i)
  {
   quest::say("Thank you! Just go out to the fields and collect the grain bags. Hand me one bag at a time, they are quite heavy, and watch out the the scarecrows as well, they can get a bit mean at times.");
  }
}

sub EVENT_ITEM
{
 if($itemcount{13990} == 1)
  {
   quest::say("Thank you for helping me with this task. It has saved me a lot of time and strength.");
    quest::ding(); quest::exp(70);
   quest::getcash(5,5,1,0);
#   quest::faction(KaranasResidents, 10);
#   quest::faction(GuardsOfQeynos, 10);
#   quest::faction(PriestsOfLife, 10);
#   quest::faction(KnightsOfThunder, 10);
  }
}