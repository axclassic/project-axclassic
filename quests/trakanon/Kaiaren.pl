sub EVENT_SAY {
my $chat = quest::saylink("chat", 1);
my $this = quest::saylink("this", 1);
   if($text=~/hail/i) {
      quest::say("AHHH! Get it away from me. Go away. ..Leave me alone.");
      }
   elsif($text=~/real/i) {
      quest::say("Very well, find my true form where it was before.");
   	  quest::spawn(95105, 0, 0, 2470, 306, -339);
	  quest::depop()
	  }
   elsif($text=~/Lheao/i) {
      quest::say("Hmmm, never heard of him. Well, it doesn't matter, the book is here now. Curse that idiot for writing it in the first place. Not even sure why I let him stick around. If you ever see that clown monk Aradiel kick him in the shins for me! At any rate, I suppose you'd like to find the Fists and have a nice $chat with them, eh? Their master owes me much. I would reward you well if you were to bring me proof of the master's defeat");
      }
   elsif($text=~/chat/i) {
      quest::say("Yes, I suppose you would. All you children looking for fame and glory will eventually learn the poison of ambition. But how will you find them? They are able to meld with their elements seamlessly and they certainly have no interest in fooling with the likes of you. No, you will need to get their attention. Fortunately, I know how you can do $this.");
      }
   elsif($text=~/this/i) {
      quest::say("My guess is that the weakest of the Fists will be the easiest to draw out. He is egotistical and arrogant. How he came to master the Discipline of Fire, I do not know. He will most likely be in another form, one of his element. When you find the one you believe to be the Fist, you must challenge him. If you use his true name, Eejag, in your formal challenge, he will respond. A flame can burn intensely but it cannot last for long. Know this when you battle him.");
      }
    elsif($text=~/found/i) {
      quest::say("Congratulations, you found my true form. Now we can discuss why you would be looking for me.");
        }
   }
sub EVENT_ITEM {
   # Handin: Celestial Fists (book) to Mad Kaiaren
   if(plugin::check_handin(\%itemcount, 1683 => 1)) {
      quest::spawn(95105, 0, 0, 2470, 306, -339);
      quest::summonitem(119829);
      quest::emote("eyes open wide and he attacks you!");
      quest::attack($name);
   }
    # Handin: Celestial Fists (book) to True Kaiaren
    elsif(plugin::check_handin(\%itemcount, 119829 => 1)) {
    # Return: Book of Celestial Fists
      quest::summonitem(1689);
      quest::say("Now, then. Where did you find this, monk? This is not just some light reading to be borrowed from the town library. Who gave this to you?");
      }
   # Handin: Charred Scale(1684)
   elsif(plugin::check_handin(\%itemcount, 1684 => 1)) {
      quest::say("Ahhh, impressive indeed! Now that you have broken the chain of the Fists, the others may come toppling down if you persevere. The Fist of Air is now the weakest, then Earth, and finally Water before the master of them all, Vorash. You must defeat them in order, proving the demise of the last to draw out the one you are after. The task before you is to take this scale and show it to the Fist of Air wherever he may be. Good luck, $name.");
      quest::summonitem(1684);
   }
   # Handin: Demon Fangs(1688), Book of Celestial Fists(1689)
   elsif(plugin::check_handin(\%itemcount, 1688 => 1, 1689 => 1)) {
      # Monk Epic 1.0 (END)(Kaiaren)
      quest::emote("bows his head and breathes a long sigh as if relieved of a great weight. He then looks up at you.");
      quest::say("I honestly did not believe you could have defeated Vorash. Even though he sought nothing by war and bloodshed, it is a life nonetheless and we must mourn him. I will sew these fangs into magical fist wraps and they shall be yours. Remember Xenevorash. A purpose can be found for every situation and individual. To achieve perfection is to perceive this truth.");
      # Summon: Monk Epic 1.0: Celestial Fists(10652)
      quest::summonitem(10652);
      quest::ding();
      quest::depop();
   }
   else {
      quest::say("I have no need for this item $name, you can have it back.");
      plugin::return_items(\%itemcount);
   }
}

sub EVENT_DEATH {
   quest::say("Not bad.. Now lets see if you can find my trueform, If you do, I will return to you the real book and we can discuss this further.");
}
# End of File


