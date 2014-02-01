#zone: tutorialb
#Revised Angelox and CrabClaw's Upgraded Absor v1.1 mod

sub EVENT_SAY{
  if ($text=~/hail/i){quest::say("Weapons are one of your main forms of combat. And a faster weapon can make the battle go in your favor. While helping out here , I found enough stones to sharpen weapons. If youd like I can sharpen your's , simply hand it to me. Although, if you get me some raw materials I can do much [better]. I also like to [collect] lost swords from different towns, incase you might run into any on your travels.");
 }elsif ($text=~/better/i){quest::say("I can repair any rusty bladed weapon if you bring it to me with a chunk of bronze, such as a Short Sword, Long Sword and the like. The kobolds are the ones you seek for the bronze, those greedy vermin have a particular eye for shiny metal ignots.  Given even more resources, I can forge you a very nice [Two Hander].");
 }elsif ($text=~/collect/i){quest::say("Well, I'm mostly interested in the three at the moment, one was is right here in these mines, belonged to a fellow who goes by the name of Poxan.");
  quest::say("The other two are in separate towns, one belongs to the Kerran Muxin, the other a Froglok by the name of Dingo.");
 }elsif ($text=~/Two Hander/i){quest::say("Interested in a weapon of real power are ya? Well it be not an easy task but get me a chunk of iron, a chunk of bronze and a Tarnished Two Handed Sword and I can forge you a mighty sword that will make you the envy of all others! Now go forth and seek said materials adventurer!");
 }
}

sub EVENT_ITEM{
  if ($item1==9997){
    quest::summonitem(7021);
    quest::say("This will do just fine. Now let me see... Ah ha! There we go. Take this and give those kobolds a sound strike on the head!");
  }elsif ($item1==9998){
    quest::summonitem(5042);
    quest::say("This will do just fine. Now let me see... Ah ha! There we go. Take this and give those kobolds a sound strike on the head!");
  }elsif ($item1==9999){
    quest::summonitem(6030);
    quest::say("This will do just fine. Now let me see... Ah ha! There we go. Take this and give those kobolds a sound strike on the head!");
  }elsif ($item1==55623){
    quest::summonitem(5071);
    quest::say("This will do just fine. Now let me see... Ah ha! There we go. Take this and give those kobolds a sound strike on the head!");
  }elsif ($itemcount{54229} == 1 && $itemcount{5013} == 1){
    quest::say("Now let me see... Ah ha! Here ya go! A much better Short Sword to help fend off those nasties!");
    quest::summonitem(5042);
  }elsif ($itemcount{54229} == 1 && $itemcount{5014} == 1){
    quest::say("Now let me see... Ah ha! Here ya go! A spiffy, repaired Axe to aid you in your adventures!");
    quest::summonitem(5043);
  }elsif ($itemcount{54229} == 1 && $itemcount{5015} == 1){
    quest::say("Now let me see... Ah ha! Here ya go! Here's a much sharper Scythe!");
    quest::summonitem(5049);
  }elsif ($itemcount{54229} == 1 && $itemcount{5016} == 1){
    quest::say("Now let me see... Ah ha! Here ya go! A mighty Broad Sword!");
    quest::summonitem(5044);
  }elsif ($itemcount{54229} == 1 && $itemcount{5019} == 1){
    quest::say("Now let me see... Ah ha! Here ya go! A refurbished Long Sword to help fend off those nasties!");
    quest::summonitem(5045);
  }elsif ($itemcount{54229} == 1 && $itemcount{5020} == 1){
    quest::say("Now let me see... Ah ha! Here ya go! A powerful Battle Axe to help defeat your foes!");
    quest::summonitem(5046);
  }elsif ($itemcount{54229} == 1 && $itemcount{5021} == 1){
    quest::say("Now let me see... Ah ha! Here ya go! A new Scimitar to help fend off those nasties!");
    quest::summonitem(5047);
  }elsif ($itemcount{54229} == 1 && $itemcount{5022} == 1){
    quest::say("Now let me see... Ah ha! Here ya go! A refurbished Bastard Sword to help fend off those nasties!");
    quest::summonitem(5048);
  }elsif ($itemcount{54229} == 1 && $itemcount{5023} == 1){
    quest::say("Now let me see... Ah ha! Here ya go! A powerful Two-Handed Sword to help fend off those nasties!");
    quest::summonitem(5070);
  }elsif ($itemcount{54229} == 1 && $itemcount{5024} == 1){
    quest::say("Now let me see... Ah ha! Here ya go! A mighty Halberd to help fend off those vermin!");
    quest::summonitem(5071);
  }elsif ($itemcount{54229} == 1 && $itemcount{59954} == 1 && $itemcount{5070} == 1){
    quest::say("Now let me see... Ah ha! Here ya go! A mighty Two Hander to conquer those vermin!");
    quest::summonitem(5030);
     }elsif ($itemcount{59968} == 1 && $itemcount{101} == 1 && $itemcount{104} == 1){
    quest::say("Very nice - here is my best sword! Use it with honor.");
    quest::summonitem(124);}
else {
quest::say("I have no use for this");
plugin::return_items(\%itemcount);}

}

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::say("The time has come for you to die!");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("It is unwise of you to try that!");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("How dare you attack me!");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("The spirits will condem you!");
    }elsif($combat_state == 1){
    quest::say("I shall bathe in your blood!");}
}

sub EVENT_DEATH{
 quest::emote("'s corpse drops to the ground.");
 }


