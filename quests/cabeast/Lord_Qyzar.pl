#Lord Qyzar is for the Greenmist quest and administers the fourth, fifth, and sixth quests in the line.

sub EVENT_SAY {
my $khukri = quest::saylink("khukri", 1);
my $diagram = quest::saylink("diagram", 1);
my $rescue = quest::saylink("rescue", 1);
 if($text=~/hail/i){
  quest::emote('looks upon you with a sneer.');
  quest::say("What is the year of our birth?");
  }
 if($text=~/371 AG/i){ #Test of the Zealot (Greenmist Quest 4/8)
 quest::say("Good and who is our father?");
 }
  if($text=~/Rile/i){
  quest::say("You are a student of our ways? I would hope so. I seek a knight in search of a way to prove his allegiance and a way to earn his zealot $khukri.");
  }
  if($text=~/khukri/i){ #Test of the Zealot (Greenmist Quest 4/8)
  quest::say("In search of a zealot khukri? I have heard much of your deeds to aid us. I offer it to you in exchange for your service. I have dispatched a knight named Grizzle to seek out the Kromdul fortress called Chalp. He was to secretly map Chalp and return with a Chalp $diagram. He has yet to return. Perhaps you can $rescue Grizzle.");
  }
  if($text=~/diagram/i){ #Test of the Zealot (Greenmist Quest 4/8)
  quest::emote('grimaces in pure disgust.');
  quest::say("I have been awaiting for the Chalp diagram from a knight named Grizzle, but alas, he has proven himself weak. He has been taken prisoner by one of the Kromdul of Chalp. If only there were another knight I could send to $rescue Grizzle and return the Chalp diagram...'");
  }
  if($text=~/rescue/i){ #Test of the Zealot (Greenmist Quest 4/8)
  quest::say("If you can find the knight in Chalp and have him hand you the Chalp diagram, you shall become a zealot and wield a zealot khukri. All I need are the Chalp diagram and your knight khukri.");
  }
  if($text=~/betrayal/i){ #Test of the Betrayal (Greenmist Quest 5/8)
  quest::say("One of our agents, a hero by the name of Goxnok, has found evidence that the book entitled 'Charasis' has been taken from this temple and is to be delivered to an unknown foe in the Outlands. Go at once to the lower levels of the temple and greet Goxnok. Hurry, before he departs!");
  quest::spawn2(106301,0,0,-113,1000,-23.9,30);
  }
  if($text=~/dagger/i){ #Test of the Hero (Greenmist Quest 6/8)
  quest::say("The visceral dagger was an ancient torturing weapon. I do not know much of it other than that it was forged by a member of the Brood of Kotiz, but that was ages ago. He is surely dust by now. Perhaps Arch Duke Xog knows more. ");
  }
}

sub EVENT_ITEM {
my $betrayal = quest::saylink("betrayal", 1);
my $dagger = quest::saylink("dagger", 1);
  if(($itemcount{12496} == 1) && ($itemcount{5123} == 1)){ #Test of the Zealot (Greenmist Quest 4/8)
  quest::say("At last!! The Chalp diagram. I shall see that the emperor gets this at once. You have proven yourself more than just a mere knight, you are a zealot. Being new to the temple we have need of you in a matter of $betrayal.");
  quest::summonitem(5124);
  quest::givecash("0","0","6","1"); 
   quest::ding(); quest::exp(1600);
  
  quest::faction(62,20);
  quest::faction(193,10);
 }
 elsif(($itemcount{1729} == 1) && ($itemcount{1730} == 1) && ($itemcount{5124} == 1)){ #Test of Betrayal (Greenmist Quest 5/8)
  quest::say("Congratulations! You are now a true crusader, but there is no time for celebration. We have lost two of our operatives. Crusaders Golin and Fodcod were dispatched to seek out an ancient artifact, the visceral $dagger. Where they have gone, I do not know. They have been gone far too long. Find them and return the dagger to me with your crusader khukri and you shall be a hero.");
  quest::summonitem(5125);
  quest::givecash("0","0","0","2"); 
   quest::ding(); quest::exp(2000);
  
  quest::faction(62,20);
  quest::faction(193,10);
 }
 elsif(($itemcount{7324} == 1) && ($itemcount{5125} == 1)){ #Test of the Hero (Greenmist Quest 6/8)
  quest::emote("gazes in astonishment at the dagger. 'Ahhh!! You have brought the sacred visceral dagger back to the Temple of Terror. Let all be aware that the great $name has returned to Cabilis a hero!! You now wield the weapon of a hero. Hail, $name, hero of the Crusaders of Greenmist.");
  quest::summonitem(5126);
  quest::givecash("0","0","0","3"); 
   quest::ding(); quest::exp(3000);
  
  quest::faction(62,20);
  quest::faction(193,10);
 }
 else{ 
 plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
 plugin::return_items(\%itemcount);
 }
}

#Submitted by: Jim Mills