sub EVENT_SAY {
my $happened = quest::saylink("happened", 1);
my $map = quest::saylink("map", 1);
   if ($text=~/Hail/i){
   quest::emote(' looks weak and his breathing is labored.');
   quest::say("'You must help me. I came here to check a map I found and while I was here, I found a treasure chest. I inspected it and found it was protected by a strange riddle. I answered it and opened the chest. I went further and found another, but I did now know the answer to open it, so I picked the lock. That's when it $happened.");
   }
   if ($text=~/happened/i){  
   quest::say("Well, I've been plagued by a horrible spell. I managed to crawl back here, but I cannot leave. I tried, but the curse got stronger. I believe we need to find the answer to the treasures kept here. I have seen four chests. You must solve their mystery. I believe that you can free me of this curse if you do . . . and uhm, maybe share your findings?");
   }
   if($signal == 79){
   quest::shout("You have solved the puzzle and cured me! I must tell you though, I know why you're here and I don't have what you're looking for. Those items were not very valuable . . . er, useful to me, so I put them in the wagon at camp. come backto me and Iwill give you the $map.");
   } 
   if ($text=~/map/i){    
   quest::say("Look at it this way, though -- you saved a life! Uhm, I gotta run!");
   $client->Message(14,"While the halfling didn't have the documents, you did aid Norrath's Keepers and will be rewarded. Hopefully, Tarpo learned a lesson");
   quest::summonitem(120152);
   quest::depop():
   }
 } 