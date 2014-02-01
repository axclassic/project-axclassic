sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote('As you look at this individual, you can tell he has something bothering him greatly.');
  quest::say('Eh? There is nothing I can help you with. I have nothing for myself anymore... except these [cursed dreams].');
  }
  elsif($text=~/what cursed dreams/i){
   quest::say('I pray that they stay locked within my mind for the world as we know it would be changed forever. In my dreams I see sand as red as blood and skies scorched from war. It is a terrible [vision].');
  }
  elsif($text=~/what vision/i){
   quest::say("I have seen visions of a dark foe gaining new strength in a plane unknown to me. It grows stronger with every passing minute. It gathers those that stand for chaos and disorder and is sending them out to search for the ultimate power of the Immortals, but it cannot be real. History reveals that he has been defeated. I see this same dream every night. It haunts me greatly. This dream seems too real, however, to not have some truth to it. If only I knew if this was a gift of foresight, or if I have finally lost my mind. If I only knew, I would be able to rest again. Please find a way to let me know if this is fact or fiction, $name .");
  }
  elsif($text=~/what time/i){
   quest::say('Time for what? Time for us to find a way to defeat this menace that threatens our ways of life. Go out and find one that may know more about the [power of the Immortals]. Please do not return until you have found someone to help.');
  }
  elsif($text=~/are you vortix/i){
   quest::say('I see you know who I truly am now. It does not matter though. There is nothing I can help you with. Danl should have been able to help you more than I could.');
  }
  elsif($text=~/where is kaiarens diary/i){
   quest::say("Kaiarens Diary? I havent seen it in some time now. If I were not such a coward, I would have kept it. I have heard rumors of it being torn in half. Some students that wanted to learn the ways of the Celestial Fists were looking for it a while back. One was a pirate that wanted to only learn the Path of the Silent to gain more treasures then he had. The other, wanted to become the most powerful fighter alive. You may want to seek them out and see if they have located pieces of it. I am sorry I could not be of more help. If you do happen to locate the two pieces, bring them back to me and maybe I will be able to aid you further. Now that you know my secret, there is no reason to remain hidden from the world. You will be able to find me resting in the Plane of Tranquility. Be safe, $name .");
  }
 }

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 48122 => 1)){ 
  quest::say('Where did you find this? Could it really be happening now, after all of this time? It couldnt be. He had been defeated... there is little [time] left for us now I am afraid.');
  }
 }

#Submitted by: Fatty Beerbelly PEQ Quest Team
#Part of Monk Epic 1.5
#Item ID: 48122 - Item Name: Muramite Sand - Item Lore: Sand that is as red as blood from scorched skies and war - Drops in Harbingers Spire
