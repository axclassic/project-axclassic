     # Code by Aeolwind for Guard Cheslin in qeytoqrg
    my $a;
    my $x;
    my $y;


    sub EVENT_SAY{
    if ($text=~/hail/i) {
       quest::pause(10);
       quest::say("Hail, mighty adventurer! I am Guard Cheslin Sydwend and I am here to serve and protect. Feel safe when we Qeynos guards are on watch. We are the best!");
    }
    if ($text=~/Your father sent me/i){
       quest::pause(10);
       quest::say("My father has no need to worry and I do not need a baby sitter. I may be in training still, but a Qeynos guard in training is still a formidable opponent. EVIL, BEWARE!! HAIL ANTONIUS BAYLE!");
    }
    if ($text=~/illusion/i){
       quest::pause(10);   
       quest::say("Oh!! Do you play Illusion, too? I love that game. I have some very rare cards in my deck. I seem to have dropped four of them somewhere during my last patrol. Darn it! They probably blew away the minute I dropped them! I will never find those cards again.");
    }
    }

    sub EVENT_AGGRO {
       quest::say("Fear not, simple travelers. Cheslin the masterful is here to protect you.");
    }

    sub EVENT_WAYPOINT {
      if ($wp == 0) {
    quest::say("Hail, fellow guards! I am off to protect the travelers of the hills from evil. I shall return!");
      } 
      if ($wp == 7) {
       quest::say("Hey! Did I just drop something?");
    my $a = quest::ChooseRandom(13904, 13905, 13906, 13907);
        quest::creategroundobject($a, -815, 1047, 22, 0, 600);
      }
      if ($wp == 4) {
       quest::say("Hey! Did I just drop something?");
    my $a = quest::ChooseRandom(13904, 13905, 13906, 13907);
        quest::creategroundobject($a, 595, 4912, 17, 0, 600);
      }
      if ($wp == 3) {
       quest::say("Hey! Did I just drop something?");
    my $a = quest::ChooseRandom(13904, 13905, 13906, 13907);
        quest::creategroundobject($a, -1009, 3386, 2, 0, 600);
      }
      if ($wp == 2) {
       quest::say("Hey! Did I just drop something?");
    my $a = quest::ChooseRandom(13904, 13905, 13906, 13907);
        quest::creategroundobject($a, -191, 1747, 115, 0, 600);
      }
    }

    sub EVENT_ITEM {
    if($itemcount{13904} == 1 || $itemcount{13905} == 1 || $itemcount{13906} == 1 || $itemcount{13907} == 1){
       quest::say("Wow!! I thought I lost this for good. All together I lost the [illusion] cards: Ebon Lotus, Library of Erudin, Chrono Cyclone and Diamond Vale. Man!! Those are rare cards!");
       plugin::return_items(\%itemcount);
    }

    if($itemcount{13904} == 1 && $itemcount{13905} == 1 && $itemcount{13906} == 1 && $itemcount{13907} == 1){
       quest::say("Oh great! I have all my cards back. Here is a little something for assisting a Qeynos guard. And any time you are in trouble, just call on Cheslin, master swordsman. Take it to my father, Master Chesgard of the Knights of Thunder in Qeynos. No doubt he sent you to follow me on my watch.");
       quest::faction(135,2);#Your faction standing with Guards of Qeynos got better.
       quest::faction(9,2);#Your faction standing with Antonius Bayle got better.
       quest::faction(53,-2);#Your faction standing with Corrupt Qeynos Guards got worse.
       quest::faction(33,-2);#Your faction standing with Circle of Unseen Hands got worse.
       quest::faction(217,2);#Your faction standing with Merchants of Qeynos got better.
        quest::ding(); quest::exp(1500);
       quest::givecash(int(rand(20)),int(rand(20)),int(rand(5)),0);
       quest::summonitem(18839);
    }else{
       quest::say("I cannot use this?!");
       plugin::return_items(\%itemcount);
    }
    }




