# Zone: draniksscar
# Site3op

sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Ah, there you are! I have wanted to meet you. After hearing about your fights with the Muramites I knew that you were one to respect. At least you have the heart to fight back against those worthless thieves. If it were up to my kinsmen we would all just roll over and thank them for ruining our world. After the battles you have been through I wonder if you could take care of a few [things] for me.");
  }
  elsif($text=~/what things/i){
    quest::say("You see, I have been keeping my eyes open. I am not one to just roll over and take what is given to me. I keep watch over those Muramites and what goes on in their ranks. I have noticed [three] of the Muramites in particular who seem to have a bit more sway in the legion than a common soldier. Perhaps if you could see that these Muramites had a bit of an accident, the rest of the dragorn would come to their senses and see that the Muramites are nothing more than a pathetic band of slavers.");
  }
  elsif($text=~/three/i){
    quest::say("The first one that I noticed was [Bowlord Rorn]. He is one of those kyv that you see around in the Muramite ranks. I watched Rorn for a while and noticed he worked with [Mistress Ujani] a good deal. Then, a few weeks later while hiding from some ukun, I came across [Guttertusk the Cruel]. He is a mean one he is. I would not put anything past him and would prefer it if I did not have to cross his path again.");
  }
  elsif($text=~/Bowlord Rorn/i){
    quest::say("As I said, Bowlord Rorn is one of those kyv. He has been keeping track of their patrols and what sorts of tasks they have been set on. If you could bring me the decorated gauntlets he is always wearing and three of the bows his fellow kyv carry it would help my efforts greatly.");
  }
  elsif($text=~/Mistress Ujani/i){
    quest::say("Mistress Ujani is a one of the ikaav. As you may know, ikaav have more than a bit of talent when it comes to magic and Ujani is no exception. She likes to dominate those around her with her charm and trance spells. I would hate to fall under her spell even for a moment. If you could kill her for me and bring me her magical amulet and a scrap of skin from three of her fellow ikaav it would be a boon to the dragorn of the city.");
  }
  elsif($text=~/Guttertusk the Cruel/i){
    quest::say("I shudder every time I think about him. I can not even tell you the tales I heard of his deeds. Aside from the good it would do my cause, his death would be a great relief to my people. As reluctant as they may be to rise against the oppression, no one deserves that sort of treatment. Bring me Guttertusks helm and the hides from three of his fellow noc and you shall have stories told of your deeds for all time.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 36532 => 3, 36531 => 1)){
    quest::faction(410,15);
    quest::faction(432,-15);
     quest::ding(); quest::exp(500000);
    if($class eq 'Warrior'){quest::summonitem("71154");}
    elsif($class eq 'Cleric'){quest::summonitem("71153");}
    elsif($class eq 'Paladin'){quest::summonitem("71154");}
    elsif($class eq 'Ranger'){quest::summonitem("71154");}
    elsif($class eq 'Shadowknight'){quest::summonitem("71154");}
    elsif($class eq 'Druid'){quest::summonitem("71153");}
    elsif($class eq 'Monk'){quest::summonitem("71154");}
    elsif($class eq 'Bard'){quest::summonitem("71154");}
    elsif($class eq 'Rogue'){quest::summonitem("71154");}
    elsif($class eq 'Shaman'){quest::summonitem("71153");}
    elsif($class eq 'Necromancer'){quest::summonitem("71153");}
    elsif($class eq 'Wizard'){quest::summonitem("71153");}
    elsif($class eq 'Magician'){quest::summonitem("71153");}
    elsif($class eq 'Enchanter'){quest::summonitem("71153");}
    elsif($class eq 'Beastlord'){quest::summonitem("71154");}
    elsif($class eq 'Berserker'){quest::summonitem("71154");}
  }
  elsif(plugin::check_handin(\%itemcount, 36530 => 3, 36529 => 1)){
    quest::say('Perfect! This will light a fire under those laggards. Here, take this ring I found in the gauntlets. It appears you were a bit tough on him when you pulled these off. Good for you!');
    quest::faction(410,15);
    quest::faction(432,-15);
     quest::ding(); quest::exp(500000);
    if($class eq 'Warrior'){quest::summonitem("71147");}
    elsif($class eq 'Cleric'){quest::summonitem("71148");}
    elsif($class eq 'Paladin'){quest::summonitem("71147");}
    elsif($class eq 'Ranger'){quest::summonitem("71147");}
    elsif($class eq 'Shadowknight'){quest::summonitem("71147");}
    elsif($class eq 'Druid'){quest::summonitem("71148");}
    elsif($class eq 'Monk'){quest::summonitem("71147");}
    elsif($class eq 'Bard'){quest::summonitem("71147");}
    elsif($class eq 'Rogue'){quest::summonitem("71147");}
    elsif($class eq 'Shaman'){quest::summonitem("71148");}
    elsif($class eq 'Necromancer'){quest::summonitem("71148");}
    elsif($class eq 'Wizard'){quest::summonitem("71148");}
    elsif($class eq 'Magician'){quest::summonitem("71148");}
    elsif($class eq 'Enchanter'){quest::summonitem("71148");}
    elsif($class eq 'Beastlord'){quest::summonitem("71147");}
    elsif($class eq 'Berserker'){quest::summonitem("71147");}
  }
  elsif(plugin::check_handin(\%itemcount, 36534 => 3, 36533 => 1)){
    quest::say('Perfect! This will light a fire under those laggards. Here, take this earring I found in the helm. It appears you were a bit tough on him when you pulled these off. Good for you!');
    quest::faction(410,15);
    quest::faction(432,-15);
     quest::ding(); quest::exp(500000);
    quest::summonitem("71150");
  }else{
    quest::say("I can't use this.");
    plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);
      }
    }
  }

