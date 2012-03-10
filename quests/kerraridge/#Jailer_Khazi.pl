#NPC: #Jailer_Khazi    Zone: kerraridge
#by Qadar

sub EVENT_SPAWN{
  if($khazi!= 3){
    quest::delglobal("khazi");
    quest::setglobal("khazi",1,3,"F");        # set $khazi = 1  (Quest not started)
    $khazi=undef;
    quest::spawn_condition("kerraridge",3,1);
  }
}

sub EVENT_SAY {
  if($khazi!=3){       # if Grexah hasnt released kobolds
    if($text=~/Hail/i){
      quest::say("Oh, hi $name.  This is not a good time for me to talk, my [keys] have gone missing.");
    }
    if($text=~/keys/i){
      quest::say("I cannot find my keys to the the kobold prisoners' pen.  I suspect Grexah took them.  He was here earlier acting suspiciously.  If you find him, ask him if he has my keys.");
    }
  }else{             # if Grexah has released prisoners
    quest::say("Please find the escaped kobolds!  They must be killed before they attack the residents!  Bring me all four of their heads and I will reward you!");
  }
}

sub EVENT_SIGNAL{                                # signaled by Grexah when he frees kobolds
  quest::delglobal("khazi");
  quest::setglobal("khazi",3,3,"F");             # set $khazi = 3 (kobolds released)
  $khazi=undef;
  quest::spawn_condition("kerraridge",3,0);
  quest::depopall(74080);
  quest::depopall(74079);              # depop any kobold prisoners
  quest::say("Somebody help me!  Grexah has released the prisoners!");
  quest::signalwith(74396,3);          # Signal Banker Naudi start quest timer
}


sub EVENT_ITEM{
  if(plugin::check_handin(\%itemcount, 14129 => 4)){          # hand in 4 kobold heads
    
    quest::say("Thank you!  You have helped save our city!  Please take this as a token of our appreciation!");

    quest::faction(132,15);                # Guardians of Shar Val better
    quest::faction(175,15);                # Kerra Isle better
     quest::ding(); quest::exp(1000);
    quest::ding;
    my $random_result = int(rand(100));  # summon random item
 
    if(($class eq 'Warrior') || ($class eq 'Cleric') || ($class eq 'Shadowknight') || ($class eq 'Bard') || ($class eq 'Paladin')){
      if($random_result<=15){
        quest::summonitem(502);
      }elsif($random_result<=30){
        quest::summonitem(503);
      }elsif($random_result<=45){
        quest::summonitem(504);
      }elsif($random_result<=60){
        quest::summonitem(505);
      }elsif($random_result<=75){
        quest::summonitem(506);
      }elsif($random_result<=90){
        quest::summonitem(507);
      }else{
        quest::summonitem(508);
      }
    }
    if(($class eq 'Rogue') || ($class eq 'Ranger') || ($class eq 'Shaman') || ($class eq 'Berserker')){
      if($random_result<=15){
        quest::summonitem(509);
      }elsif($random_result<=30){
        quest::summonitem(510);
      }elsif($random_result<=45){
        quest::summonitem(511);
      }elsif($random_result<=60){
        quest::summonitem(512);
      }elsif($random_result<=75){
        quest::summonitem(513);
      }elsif($random_result<=90){
        quest::summonitem(514);
      }else{
        quest::summonitem(515);
      }
    }
    if(($class eq 'Druid') || ($class eq 'Beastlord')  || ($class eq 'Monk')){
      if($random_result<=15){
        quest::summonitem(516);
      }elsif($random_result<=30){
        quest::summonitem(517);
      }elsif($random_result<=45){
        quest::summonitem(518);
      }elsif($random_result<=60){
        quest::summonitem(519);
      }elsif($random_result<=75){
        quest::summonitem(520);
      }elsif($random_result<=90){
        quest::summonitem(521);
      }else{
        quest::summonitem(522);
      }
    }
    if(($class eq 'Wizard') || ($class eq 'Magician') || ($class eq 'Enchanter') || ($class eq 'Necromancer')){
      if($random_result<=15){
        quest::summonitem(523);
      }elsif($random_result<=30){
        quest::summonitem(524);
      }elsif($random_result<=45){
        quest::summonitem(525);
      }elsif($random_result<=60){
        quest::summonitem(526);
      }elsif($random_result<=75){
        quest::summonitem(527);
      }elsif($random_result<=90){
        quest::summonitem(528);
      }else{
        quest::summonitem(529);
      }
    }

    quest::spawn_condition("kerraridge",3,1);
    quest::depopall(74541);
    quest::delglobal("khazi");
    quest::setglobal("khazi",1,3,"F");           # reset quest on handin
    $khazi=undef;
  }elsif(plugin::check_handin(\%itemcount, 501 => 1)){   #if key is given to Khazi instead of Grexah
    quest::say("So you are the one who stole my keys!  Begone, thief, before I call the guards!");
    quest::faction(132,-1);                # Guardians of Shar Val worse
    quest::faction(175,-1);                # Kerra Isle worse
  }else{
    plugin::return_items(\%itemcount);           # give back items
  }
}
