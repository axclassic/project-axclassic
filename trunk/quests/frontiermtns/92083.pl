sub EVENT_SAY {
my $sent = quest::saylink("sent", 1);
my $coppernickel = quest::saylink("coppernickel", 1);
if ($text=~/hail/i){
    quest::emote('an Iksar slave seems to have lost all hope. He sadly looks to the ground. His shackles are different than the others you see in this cell. One is definitely steel and not of goblin design. The other is made of an unfamiliar metal.');
    quest::say("What is it you want of me? do you know who I am?");
  }
if ($text=~/Veltar/i){
    quest::emote('an Iksar slaves soiled face shines with a glint of hope.');
	quest::say("You know my name? Has Master Rinmark $sent you to find me?");
  }
  if ($text=~/sent/i){
    quest::say("Then word has gotten to him!! If you be a monk of the third rung I will accept your aid. You must find the $coppernickel key. It is required to release me from this goblin shackle. I have no reward to offer other than the shackle of steel. Give me both your shackles of the third rung along with the key and I shall reward you the first shackle of the fourth rung.");
  }
 if ($text=~/coppernickel/i){ 
    quest::say("The key is split into three parts. Part one is the base and must be combined with the two remainder pieces. One piece is in here and the other was lost. I overheard the goblins chattering and recognized the goblin phrase, lair of flying mouths!! As for the base, I do not know.");
  }
}
sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 12839 =>1, 12837 =>1, 12838 =>1 )) {
    quest::say("I made a pact to reward the shackle of steel to one who could deliver the coppernickel key and the shackles of copper and bronze.");
    quest::emote('hands you a shackle and removes the coppernickel shackle so he may flee. He places your shackles on his wrists and darts into the darkness');
    quest::ding();
	quest::exp(5000);
	quest::summonitem(4196);
	quest::faction(317,20);
    quest::faction(193,20);
	}
 }	