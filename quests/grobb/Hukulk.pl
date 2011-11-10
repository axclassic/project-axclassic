    sub EVENT_SAY {

    if($text=~/Hail/i){
    quest::say("What you want!!  You make fun of helm of Hukulk?!!  Me smash you!!  Maybe you come learn ways of Hate and Fear!  You be dark power.  You be Pain. You want [join Nightkeep]?");
    }

    if($text=~/join Nightkeep/i){
    quest::say("Good.  Hate and Pain.  Cazic-Thule teach power. I teach power.  Me make you power.  You do what me say.  You no mess up. I no kill you.  We no like dead creature we no own.  Go. kill dem.  Bring four bone chips.  I make you power.");
    }

}

    sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 18792 => 1)){
    quest::say("Haaah!! Bow to Hukulk!! Hukulk make you feared.. make you powered! Dark power flow through you! Hate and Fear in your blood! Go to Vergad. He give you first lesson in pain.");
    quest::summonitem("13530");
    
    quest::ding(); quest::exp("1000");
    quest::faction(292,200);
    }

    if (plugin::check_handin(\%itemcount, 13073 =>4 )) {

      quest::say("You good. Take dis. Make much pain and hurt. Make tings bleeds. Kill, hurt all. Innoruuk and me say do, now go. You do much, come bak. Teach you how more hurt and pain make. Go.");
      
      quest::summonitem(5023);
      quest::faction( 292,2 );
      quest::faction( 128,2 );
      quest::faction( 22,-2 );
      quest::faction( 66,2 );

    }

else {
    plugin::return_items(\%itemcount); #function from file plugins/check_handin.pl
    plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight'); #function from file plugins/guildmasters.pl
      }

}

    #END of FILE Zone:grobb  ID:40023 -- Hukulk