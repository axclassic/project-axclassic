#Eda_Wharhammer.pl
#PoP quest armor emblem exchange

sub EVENT_SAY {
   my $emblem = quest::saylink("emblem", 1);
   my $chain = quest::saylink("chain", 1);
   my $silk = quest::saylink("silk", 1);
   my $leather = quest::saylink("leather", 1);
   my $plate = quest::saylink("plate", 1);
   my $swatch = quest::saylink("swatch", 1);
   my $text1 = quest::saylink("wrong", 1);
   my $text2 = quest::saylink("wrong", 1);
   my $text3 = quest::saylink("wrong", 1);
   my $text4 = quest::saylink("wrong", 1);
   my $Ranger = quest::saylink("Ranger", 1);
   my $Rogue = quest::saylink("Rogue", 1);
   my $Shaman = quest::saylink("Shaman", 1);
   my $Berserker = quest::saylink("Berserker", 1);
   my $Necromancer = quest::saylink("Necromancer", 1);
   my $Wizard = quest::saylink("Wizard", 1);
   my $Magician = quest::saylink("Magician", 1);
   my $Enchanter = quest::saylink("Enchanter", 1);
   my $Druid = quest::saylink("Druid", 1);
   my $Monk = quest::saylink("Monk", 1);
   my $Beastlord = quest::saylink("Beastlord", 1);
   my $Cleric = quest::saylink("Cleric", 1);
   my $Warrior = quest::saylink("Warrior", 1);
   my $Shadowknight = quest::saylink("Shadowknight", 1);
   my $Paladin = quest::saylink("Paladin", 1);
   my $Bard = quest::saylink("Bard", 1);
   
   if($text=~/hail/i && $ulevel >=50) {
        quest::say("'Ello traveler, Did that man of mine send you to see me? You must need a different $emblem that what you thought.");
		}
	if($text=~/hail/i && $ulevel <=50) {
		quest::say("Ye look mighty inexperienced t'be in this area. $name. Come an' seek me out when ye 'ave more knowledge o'the planes!");
      }
    elsif($text=~/emblem/i && $ulevel >=50) {	
       quest::say("I figured as much, that old coot likes making the things, but when it comes to customer service.....");
	   quest::say("let me see ifn' I kin help ye out in some way.");
	   quest::say("Which one does ye want? $Ranger, $Rogue, $Shaman, $Berserker, $Necromancer, $Wizard, $Magician, $Enchanter, $Druid, $Monk, $Beastlord, $Cleric, $Warrior, $Shadowknight, $Paladin or $Bard?");
	   }
	elsif($text=~/Ranger/i && $ulevel >=50) {
      quest::say("So you need the ranger emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' ranger emblem and furnace."); 
	  quest::setglobal("exchange_ranger",1,7,"M30");
	  }
   elsif($text=~/Rogue/i && $ulevel >=50) {
      quest::say("So you need the rogue emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' rogue emblem and furnace."); 
	  quest::setglobal("exchange_rogue",1,7,"M30");
	  }
   elsif($text=~/Shaman/i && $ulevel >=50) {
      quest::say("So you need the shaman emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' shaman emblem and furnace."); 
	  quest::setglobal("exchange_shaman",1,7,"M30");
	  }
   elsif($text=~/Berserker/i && $ulevel >=50) {
      quest::say("So you need the berserker emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' berserker emblem and furnace."); 
	  quest::setglobal("exchange_berserker",1,7,"M30");
	  }
   elsif($text=~/Necromancer/i && $ulevel >=50) {
      quest::say("So you need the necromancer emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' necromancer emblem and sewing kit."); 
	  quest::setglobal("exchange_necromancer",1,7,"M30");
	  }
   elsif($text=~/Wizard/i && $ulevel >=50) {
      quest::say("So you need the wizard emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' wizard emblem and sewing kit."); 
	  quest::setglobal("exchange_wizard",1,7,"M30");
	  }
   elsif($text=~/Magician/i && $ulevel >=50) {
      quest::say("So you need the magician emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' magician emblem and sewing kit."); 
	  quest::setglobal("exchange_magician",1,7,"M30");
	  }	  
   elsif($text=~/Enchanter/i && $ulevel >=50) {
      quest::say("So you need the enchanter emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' enchanter emblem and sewing kit."); 
	  quest::setglobal("exchange_enchanter",1,7,"M30");
	  }	  
   elsif($text=~/Druid/i && $ulevel >=50) {
      quest::say("So you need the druid emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' druid emblem and furnace."); 
	  quest::setglobal("exchange_druid",1,7,"M30");
	  }	  
   elsif($text=~/Monk/i && $ulevel >=50) {
      quest::say("So you need the monk emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' monk emblem and sewing kit."); 
	  quest::setglobal("exchange_monk",1,7,"M30");
	  }	 
   elsif($text=~/Beastlord/i && $ulevel >=50) {
      quest::say("So you need the beastlord emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' beastlord emblem and sewing kit."); 
	  quest::setglobal("exchange_beastlord",1,7,"M30");
	  }	 
   elsif($text=~/Cleric/i && $ulevel >=50) {
      quest::say("So you need the cleric emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' cleric emblem and furnace."); 
	  quest::setglobal("exchange_cleric",1,7,"M30");
	  }	 
   elsif($text=~/Warrior/i && $ulevel >=50) {
      quest::say("So you need the warrior emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' warrior emblem and furnace."); 
	  quest::setglobal("exchange_warrior",1,7,"M30");
	  }	  
   elsif($text=~/Shadowknight/i && $ulevel >=50) {
      quest::say("So you need the shadowknight emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' shadowknight emblem and furnace."); 
	  quest::setglobal("exchange_shadowknight",1,7,"M30");
	  }	  
   elsif($text=~/Paladin/i && $ulevel >=50) {
      quest::say("So you need the paladin emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' paladin emblem and furnace."); 
	  quest::setglobal("exchange_paladin",1,7,"M30");
	  }	  
   elsif($text=~/Bard/i && $ulevel >=50) {
      quest::say("So you need the bard emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' bard emblem and furnace."); 
	  quest::setglobal("exchange_bard",1,7,"M30");
	  }	    	  
       else {
         #do nothing
      }
  }  
sub EVENT_ITEM{
   if($ulevel >= 50 && defined $qglobals{exchange_warrior}) {
       if(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) {
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16274 => 1, 17184 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
 	  }
	  else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 }
	  if($ulevel >= 50 && defined $qglobals{exchange_cleric}) {
	    if(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) {
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	
	   elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	
	   elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	
	   elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	
	   elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) { 
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	
	   elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) { 
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	
	   elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	
	   elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	
	   elsif(plugin::check_handin(\%itemcount, 16274 => 1, 17184 => 1 )) { 
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	
	   elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	  
	   elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	
	   elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) { 
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	
	   elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	
	   elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	
	   elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("exchange_cleric");
	  }	
	   else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 }
	   if($ulevel >= 50 && defined $qglobals{exchange_paladin}) {
	     if(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) { 
         quest::summonitem(16269);#Paladin Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_paladin");
      }
	  elsif(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) { 
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("exchange_paladin");
      }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("exchange_paladin");
      }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("exchange_paladin");
      }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) { 
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("exchange_paladin");
      }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) { 
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("exchange_paladin");
      }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("exchange_paladin");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("exchange_paladin");
      }
	  elsif(plugin::check_handin(\%itemcount, 16274 => 1, 17184 => 1 )) { 
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("exchange_paladin");
      }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("exchange_paladin");
      }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("exchange_paladin");
      }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) { 
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("exchange_paladin");
      }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("exchange_paladin");
      }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("exchange_paladin");
      }
	  elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("exchange_paladin");
	  }	
     else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 } 
	   if($ulevel >= 50 && defined $qglobals{exchange_ranger}) {  
	      if(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) {
	      quest::summonitem(16272);#Ranger Emblem
          quest::summonitem(17184);#Mystical Furnace of Ro
          quest::delglobal("exchange_ranger");
      }
	  elsif(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) { 
	     quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_ranger");
      }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	     quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_ranger");
      }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	     quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_ranger");
      }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) { 
	     quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_ranger");
      }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) { 
	     quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_ranger");
      }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	     quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_ranger");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_ranger");
      }
	  elsif(plugin::check_handin(\%itemcount, 16274 => 1, 17184 => 1 )) { 
	     quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_ranger");
      }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	     quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_ranger");
      }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	     quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_ranger");
      }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) { 
	     quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_ranger");
      }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	     quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_ranger");
      }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	     quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_ranger");
      }
	  elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	     quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_ranger");
	 } 
	  else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 } 
	    if($ulevel >= 50 && defined $qglobals{exchange_shadowknight}) {  
	      if(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) { 
	      quest::summonitem(16270);#Shadowknight Emblem
          quest::summonitem(17184);#Mystical Furnace of Ro
          quest::delglobal("exchange_shadowknight");
      }
	  elsif(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) { 
	     quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shadowknight");
      }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	     quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shadowknight");
      }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	     quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shadowknight");
      }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) { 
	     quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shadowknight");
      }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) {
	     quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shadowknight");
      }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	     quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shadowknight");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shadowknight");
      }
	  elsif(plugin::check_handin(\%itemcount, 16274 => 1, 17184 => 1 )) { 
	     quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shadowknight");
      }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	     quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shadowknight");
      }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	     quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shadowknight");
      }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) {
	     quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shadowknight");
      }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	     quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shadowknight");
      }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	     quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shadowknight");
      }
	  elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	     quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shadowknight");
 	  }	
	  else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 } 
	    if($ulevel >= 50 && defined $qglobals{exchange_druid}) {  	  
          if(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) { 
	      quest::summonitem(16276);#Druid Emblem
          quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
          quest::delglobal("exchange_druid");
      }
	  elsif(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) { 
	     quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_druid");
      }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	     quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_druid");
      }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	     quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_druid");
      }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	     quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_druid");
      }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) { 
	     quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_druid");
      }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	     quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_druid");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_druid");
      }
	  elsif(plugin::check_handin(\%itemcount, 16274 => 1, 17184 => 1 )) { 
	     quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_druid");
      }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	     quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_druid");
      }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	     quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_druid");
      }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) { 
	     quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_druid");
      }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	     quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_druid");
      }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	     quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_druid");
      }
	  elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	     quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_druid");
 	  }
	  else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 } 
	    if($ulevel >= 50 && defined $qglobals{exchange_monk}) { 
         if(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) { 
	      quest::summonitem(16275);#Monk Emblem
          quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
          quest::delglobal("exchange_monk");
      }
	  elsif(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) { 
	     quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_monk");
      }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	     quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_monk");
      }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	     quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_monk");
      }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	     quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_monk");
      }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) {
	     quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_monk");
      }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	     quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_monk");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_monk");
      }
	  elsif(plugin::check_handin(\%itemcount, 16274 => 1, 17184 => 1 )) { 
	     quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_monk");
      }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	     quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_monk");
      }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	     quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_monk");
      }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) { 
	     quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_monk");
      }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	     quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_monk");
      }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	     quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_monk");
      }
	  elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	     quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_monk");
  	  }
	   else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 } 
	    if($ulevel >= 50 && defined $qglobals{exchange_bard}) { 	  
	     if(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) { 
	      quest::summonitem(16268);#Bard Emblem
          quest::summonitem(17184);#Mystical Furnace of Ro
          quest::delglobal("exchange_bard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16274 => 1, 17184 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
      }
	   elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	     quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_bard");
 	  }	
      else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 } 
	    if($ulevel >= 50 && defined $qglobals{exchange_rogue}) { 	
         if(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) { 
	      quest::summonitem(16273);#Rogue Emblem
          quest::summonitem(17184);#Mystical Furnace of Ro
          quest::delglobal("exchange_rogue");
      }
	  elsif(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) { 
	     quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_rogue");
      }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	     quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_rogue");
      }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	     quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_rogue");
      }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	     quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_rogue");
      }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) { 
	     quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_rogue");
      }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	     quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_rogue");
      }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) { 
	     quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_rogue");
      }
	  elsif(plugin::check_handin(\%itemcount, 16274 => 1, 17184 => 1 )) { 
	     quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_rogue");
      }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	     quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_rogue");
      }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	     quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_rogue");
      }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) { 
	     quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_rogue");
      }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	     quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_rogue");
      }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	     quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_rogue");
      }
	  elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	     quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_rogue");
      }
	   else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 } 
	    if($ulevel >= 50 && defined $qglobals{exchange_shaman}) { 	
	      if(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) { 
	       quest::summonitem(16274);#Shaman Emblem
           quest::summonitem(17184);#Mystical Furnace of Ro
           quest::delglobal("exchange_shaman");
      }
	  elsif(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) { 
	     quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shaman");
      }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	     quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shaman");
      }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	     quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shaman");
      }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	     quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shaman");
      }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) { 
	     quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shaman");
      }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	     quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shaman");
      }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) { 
	     quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shaman");
      }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	     quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shaman");
      }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	     quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shaman");
      }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) { 
	     quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shaman");
      }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	     quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shaman");
      }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	     quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shaman");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shaman");
      }
	  elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	     quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_shaman");
      }
	   else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 } 
	    if($ulevel >= 50 && defined $qglobals{exchange_necromancer}) { 	
          if(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) { 
	       quest::summonitem(16278);#Necromancer Emblem
           quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
           quest::delglobal("exchange_necromancer");
      }
	  elsif(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) { 
	     quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_necromancer");
      }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	     quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_necromancer");
      }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	     quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_necromancer");
      }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	     quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_necromancer");
      }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) { 
	     quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_necromancer");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_necromancer");
      }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	     quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_necromancer");
      }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) { 
	     quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_necromancer");
      }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	     quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_necromancer");
      }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) { 
	     quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_necromancer");
      }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	     quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_necromancer");
      }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	     quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_necromancer");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_necromancer");
      }
	  elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	     quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_necromancer");
     } 
	  else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 } 
	    if($ulevel >= 50 && defined $qglobals{exchange_wizard}) { 	
	     if(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) { 
	       quest::summonitem(16279);#Wizard Emblem
           quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
           quest::delglobal("exchange_wizard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) { 
	     quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_wizard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	     quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_wizard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	     quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_wizard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	     quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_wizard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) { 
	     quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_wizard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_wizard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	     quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_wizard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) { 
	     quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_wizard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	     quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_wizard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) { 
	     quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_wizard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	     quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_wizard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	     quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_wizard");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_wizard");
      }
	  elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	     quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_wizard");
      }
	   else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 } 
	    if($ulevel >= 50 && defined $qglobals{exchange_magician}) { 	
	      if(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) { 
	       quest::summonitem(16280);#Magician Emblem
           quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
           quest::delglobal("exchange_magician");
      }
	  elsif(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) { 
	     quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_magician");
      }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	     quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_magician");
      }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	     quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_magician");
      }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	     quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_magician");
      }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) { 
	     quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_magician");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_magician");
      }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	     quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_magician");
      }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) { 
	     quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_magician");
      }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	     quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_magician");
      }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	     quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_magician");
      }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	     quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_magician");
      }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	     quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_magician");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_magician");
      }
	  elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	     quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_magician");
      }
	   else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 } 
	    if($ulevel >= 50 && defined $qglobals{exchange_enchanter}) { 	
	      if(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) { 
	        quest::summonitem(16281);#Enchanter Emblem
            quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
            quest::delglobal("exchange_enchanter");
      }
	  elsif(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) { 
	     quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_enchanter");
      }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	     quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_enchanter");
      }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	     quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_enchanter");
      }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	     quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_enchanter");
      }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) { 
	     quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_enchanter");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_enchanter");
      }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	     quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_enchanter");
      }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) { 
	     quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_enchanter");
      }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	     quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_enchanter");
      }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	     quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_enchanter");
      }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) { 
	     quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_enchanter");
      }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	     quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_enchanter");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_enchanter");
      }
	  elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	     quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_enchanter");
      }
	   else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 } 
	    if($ulevel >= 50 && defined $qglobals{exchange_beastlord}) { 	
	      if(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) { 
	        quest::summonitem(16277);#Beastlord Emblem
            quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
            quest::delglobal("exchange_beastlord");
      }
	  elsif(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) { 
	     quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_beastlord");
      }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	     quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_beastlord");
      }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	     quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_beastlord");
      }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	     quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_beastlord");
      }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) { 
	     quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_beastlord");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_beastlord");
      }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	     quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_beastlord");
      }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) { 
	     quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_beastlord");
      }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	     quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_beastlord");
      }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	     quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_beastlord");
      }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) { 
	     quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_beastlord");
      }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	     quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_beastlord");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_beastlord");
      }
	  elsif(plugin::check_handin(\%itemcount, 32000 => 1, 17184 => 1 )) { 
	     quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("exchange_beastlord");
      }
	   else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
	 } 
	    if($ulevel >= 50 && defined $qglobals{exchange_berserker}) { 	
	      if(plugin::check_handin(\%itemcount, 16267 => 1, 17184 => 1 )) { 
	        quest::summonitem(32000);#Berserker Emblem
            quest::summonitem(17184);#Mystical Furnace of Ro
            quest::delglobal("exchange_berserker");
	  }
	  elsif(plugin::check_handin(\%itemcount, 16271 => 1, 17184 => 1 )) { 
	     quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_berserker");
	  }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1, 17184 => 1 )) { 
	     quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_berserker");
	  }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1, 17184 => 1 )) { 
	     quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_berserker");
	  }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1, 17184 => 1 )) { 
	     quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_berserker");
	  }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1, 17185 => 1 )) { 
	     quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_berserker");
	  }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_berserker");
	  }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1, 17184 => 1 )) { 
	     quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_berserker");
	  }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1, 17185 => 1 )) { 
	     quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_berserker");
	  }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1, 17185 => 1 )) { 
	     quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_berserker");
	  }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1, 17185 => 1 )) { 
	     quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_berserker");
	  }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1, 17185 => 1 )) { 
	     quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_berserker");
	  }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1, 17185 => 1 )) { 
	     quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_berserker");
	  }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1, 17185 => 1 )) { 
	     quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_berserker");
	  }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1, 17184 => 1 )) { 
	     quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_berserker");
	  }
	 
      else {
        $client->Message(14,"$name, This is not what I asked ye fer! Take it back!");
         plugin::return_items(\%itemcount);
         return 1;
      }
   }  
  }
