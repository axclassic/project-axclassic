#############
#NPC: Malka_Rale
#Quest by:
#Quest Name: Starts Ragebringer, Rogue Epic Quest
#Revised: Olhadon
#NPCs Involved: Vilnius the Small
#Items Involved: Stanos' Pouch ID:28014
#zone: qcat

sub EVENT_SAY {
  # To make Rogue only, add in ($class eq "Rogue") to the if statement
  if($ulevel >= 50){
    if($text=~/hail/i){
      quest::say("Whew! I thought you were one of Hanns' goons. These sewers are a mess, you never know what is going to turn up next. I really wish I could get out of here."); 
    }
    elsif($text=~/hanns/i){
      quest::say("Hanns runs the Circle of Unseen Hands. They had an item someone hired me to.. reacquire. I managed to get the item, stealing it right from the heart of the guild hall. The problem is, I had to carve a way out, and left a few extra holes in several of Hanns' people. I have been trapped down here in these stinking catacombs and sewers for too long now, and I do not think I can get out of here without some help.");
    }
    elsif($text=~/out of here/i){
      quest::say("Aye, $name, out of here. I am stuck until the heat dies down. The Circle has all the exits covered, though they are not stupid enough to send someone in here after me. I HOPE! In any case, I can't get back out to West Karana to meet my contact, and I was paid quite a lot of money to do this job. I hate having unfinished business.");
    }
    elsif(($text=~/i can help/i)||($text=~/i will help/i)){
      quest::say("Ok! I am trusting you. Take this pouch to Vilnius in West Karana. Last word I had from him, he was hanging out near one of the bandit camps. Be careful, since he does not know you. Just give him the pouch, and tell him I was.. delayed.  While you are doing that, I will be thinking of a way to get out of this slimehole. With any luck, the Circle will learn the pouch is out of Qeynos, and will assume I got away. That means they won't be looking for me here.");
      #Stanos' Pouch ID:28014
      quest::summonitem(28014); 
    }
  }
}

#END of FILE Zone:qcat  ID:45095 -- Malka_Rale 

