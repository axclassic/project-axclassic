#Quests covered in this file:
#Shaman Skull Quest 6

sub EVENT_SAY {
   if($text=~/sisters/i) {
      quest::say("Looking for the skull I had for sale? I am afraid I sold it to a staunch lizard champion. I would gladly give you his name if you would do me a slight $favor.");
   }
   if($text=~/favor/i) {
      quest::say("The lake garrison has requested that I work on a helm similar to the ones worn by sarnak dragoons. The problem is.. I need one to examine. You go get me one and I will tell you who purchased the skull.");
   }
}

sub EVENT_ITEM
{
   #Turn in the Sarnak Dragoon Helm  dropped off of Sarnak Dragoons in lake of ill omen
   if(plugin::check_handin(\%itemcount, 12761 => 1)) {
   quest::emote(' appears a little shaken. He has a few bruises on his face.');
      quest::say("Uhh. Thanks. I sort of told the lizard who bought the skull that you were asking for him, and, well, he was kinda mad, and... $name, meet Bruiser.");
      quest::unique_spawn(85245,0,0,$x + 5,$y,$z); 
   }

   plugin::return_items(\%itemcount); #return items if not the ones required
}

sub EVENT_SIGNAL {
   quest::signalwith(85245,51);
   quest::emote(' shakes with fear. A dark stain begins to spread across the front of his trousers.');
   quest::say("Ye.. Ye.. Yes.. Yes, Bruiser.");
   
  } 
