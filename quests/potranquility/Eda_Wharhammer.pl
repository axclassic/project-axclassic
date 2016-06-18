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
	  }
   elsif($text=~/Rogue/i && $ulevel >=50) {
      quest::say("So you need the rogue emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' rogue emblem and furnace."); 
	  }
   elsif($text=~/Shaman/i && $ulevel >=50) {
      quest::say("So you need the shaman emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' shaman emblem and furnace."); 
	  }
   elsif($text=~/Berserker/i && $ulevel >=50) {
      quest::say("So you need the berserker emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' berserker emblem and furnace."); 
	  }
   elsif($text=~/Necromancer/i && $ulevel >=50) {
      quest::say("So you need the necromancer emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' necromancer emblem and sewing kit."); 
	  }
   elsif($text=~/Wizard/i && $ulevel >=50) {
      quest::say("So you need the wizard emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' wizard emblem and sewing kit."); 
	  }
   elsif($text=~/Magician/i && $ulevel >=50) {
      quest::say("So you need the magician emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' magician emblem and sewing kit."); 
	  }	  
   elsif($text=~/Enchanter/i && $ulevel >=50) {
      quest::say("So you need the enchanter emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' enchanter emblem and sewing kit."); 
	  }	  
   elsif($text=~/Druid/i && $ulevel >=50) {
      quest::say("So you need the druid emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' druid emblem and furnace."); 
	  }	  
   elsif($text=~/Monk/i && $ulevel >=50) {
      quest::say("So you need the monk emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' monk emblem and sewing kit."); 
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
	  }	  
   elsif($text=~/Shadowknight/i && $ulevel >=50) {
      quest::say("So you need the shadowknight emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' shadowknight emblem and furnace."); 
	  }	  
   elsif($text=~/Paladin/i && $ulevel >=50) {
      quest::say("So you need the paladin emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' paladin emblem and furnace."); 
	  }	  
   elsif($text=~/Bard/i && $ulevel >=50) {
      quest::say("So you need the bard emblem eh? Very well then $name, hand me the emblem, and furnace or sewing kit that ye don' want and  I'll replace 'em wit th' bard emblem and furnace."); 
	  }	    	  
       else {
         #do nothing
      }
  }  
sub EVENT_ITEM{
   
       if($ulevel >= 50 && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) {
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16274 => 1 && 17184 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	     quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("exchange_warrior");
      }
	  elsif(plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
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
