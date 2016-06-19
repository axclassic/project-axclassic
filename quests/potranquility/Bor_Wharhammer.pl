#Bor_Wharhammer.pl
#PoP quest armors

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
        quest::say("Greetin's t'ye $name!  Isn't the area 'round 'ere so nice an' quiet?  Such a departure from me old days; slaving o'er the forge t'create masterpieces!  T'be 'onest. at times I do miss the old forge. but after I created me finest breastplate. it seemed as if nothing else I made could ever live up t'it.  So I left me home to'wander the land an' see what I could learn o'the world.  I 'ave learned quite a bit from the elders 'ere an' the skilled craftspeople in New Tanaan.  I 'ave even devised a type o'$emblem that will impart the magic o'tranquility into the user t'create planar armors from pieces o'energy found in the planes.");
   }
   elsif($text=~/emblem/i && $ulevel >=50) {
         quest::say("Well, the emblems dinnae be easy t'craft but I will gladly give ye one fer the price of 500 platinum pieces. They allow a planes traveler with no craftin' skills t'create many fine pieces o'planar armor in a special, magical kit I also 'ave an' will throw in with the price. The kit acts as a focal point fer the wild magic energy o'the Planes. Ye will only be able t'use each emblem an' kit once when ye create the piece, 'owever I dinnae be goin' anywhere soon! Just venture back when ye need another an' dinnae ferget the coin!");
         quest::say("Might ye be interested in $chain $silk $leather $plate or do ye need to know how to make a $swatch?");
	}
   elsif($text=~/chain/i && $ulevel >=50) {
      quest::say("Ahhhhh $name! Chain armors, while not as sturdy as plate, provide so much more mobility if constructed properly. T'construct a piece o'chain armor, ye need t'combine a chain pattern, an emblem, various amounts of ethereal metal rings an' use one o'those crafty Tanaan smithin' 'ammers all within a furnace touched by Ro. Ethereal metal ring construction is another matter. Ye will need to combine a brick o'ethereal energy, an ethereal temper an' a file within a Tanaan forge. I would seek a skilled craftsperson t'make the rings fer ye; the emblem will enable ye t'craft the final armor piece no matter what yer skill be.");
      quest::say("Ye realize, these here Emblems kin only be fer specific classes, so tell me which one ye be lookin' fer. Be it fer $Ranger, $Rogue, $Shaman or $Berserker.");
	  quest::say("Or are ye back cuz ye got the $text1 emblem?");
	}
   elsif($text=~/Ranger/i && $ulevel >=50) {
      quest::say("Very well, a ranger emblem and furnace of Ro. That will be 500 platinum please.");
	  quest:;setglobal("ranger_emblem",1,7,"M30");
	}  
   elsif($text=~/Rogue/i && $ulevel >=50) {
      quest::say("Very well, a rogue emblem and furnace of Ro. That will be 500 platinum please.");
	  quest:;setglobal("rogue_emblem",1,7,"M30");
	}
   elsif($text=~/Shaman/i && $ulevel >=50) {
      quest::say("Very well, a shaman emblem and furnace of Ro. That will be 500 platinum please.");
	  quest:;setglobal("shaman_emblem",1,7,"M30");
	}  
   elsif($text=~/Berserker/i && $ulevel >=50) {
      quest::say("Very well, a berserker emblem and furnace of Ro. That will be 500 platinum please.");
	  quest:;setglobal("berserker_emblem",1,7,"M30");
	}  
   elsif($text=~/silk/i && $ulevel >=50) {
      quest::say("Har! It be quite funny that we be referin' t'silk as armor, fer the amount o'protection it provides be miniscule at best. The planar armor made from strands o'ether can still be quite useful fer its magical properties, 'owever. Ye will need t'take up a Tanaan embroidery needle, a pattern, an emblem an' various amounts o'ether silk swatches t'create a piece. Craft it all within a sewing kit boilin' with magical energy.");
	  quest::say("Ye realize, these here Emblems kin only be fer specific classes, so tell me which one ye be lookin' fer. Be it fer $Necromancer, $Wizard, $Magician or $Enchanter.");
	  quest::say ("Or are ye back cuz ye got the $text2 emblem?");
   }
   elsif($text=~/Necromancer/i && $ulevel >=50) {
      quest::say("Very well, a necromaner emblem and Druzzil's Mystical Sewing Kit. That will be 500 platinum please.");
	  quest:;setglobal("necromancer_emblem",1,7,"M30");
	}  
	elsif($text=~/Wizard/i && $ulevel >=50) {
      quest::say("Very well, a wizard emblem and Druzzil's Mystical Sewing Kit. That will be 500 platinum please.");
	  quest:;setglobal("wizard_emblem",1,7,"M30");
	}  
	elsif($text=~/Magician/i && $ulevel >=50) {
      quest::say("Very well, a magician emblem and Druzzil's Mystical Sewing Kit. That will be 500 platinum please.");
	  quest:;setglobal("magician_emblem",1,7,"M30");
	}  
	elsif($text=~/Enchanter/i && $ulevel >=50) {
      quest::say("Very well, a enchanter emblem and Druzzil's Mystical Sewing Kit. That will be 500 platinum please.");
	  quest:;setglobal("enchanter_emblem",1,7,"M30");
	}  
   elsif($text=~/leather/i && $ulevel >=50) {
      quest::say("Leather armor provides little protection due t'the make-up o'the materials. We shall do our best, 'owever, t'see ye make a quality piece. T'do so, ye must combine a pattern, an emblem, various pieces o'cured ethereal energy an' a Tanaan embroidery needle all within a sewing kit boilin' with magical energy. The cured energy may be problematic fer an unskilled craftsman, 'owever. Just sew two silk ethereal swatches together using a Tanaan embroidery needle within a Tanaan loom. I can just imagine yer next question t'be about swatches, aye?");
	  quest::say("Ye realize, these here Emblems kin only be fer specific classes, so tell me which one ye be lookin' fer. Be it fer $Druid, $Monk or $Beastlord.");
	  quest::say("Or are ye back cuz ye got the $text3 emblem?");
   }
   elsif($text=~/Druid/i && $ulevel >=50) {
      quest::say("Very well, a druid emblem and Druzzil's Mystical Sewing Kit. That will be 500 platinum please.");
	  quest:;setglobal("druid_emblem",1,7,"M30");
	}  
	elsif($text=~/Monk/i && $ulevel >=50) {
      quest::say("Very well, a monk emblem and Druzzil's Mystical Sewing Kit. That will be 500 platinum please.");
	  quest:;setglobal("monk_emblem",1,7,"M30");
	}  
	elsif($text=~/Beastlord/i && $ulevel >=50) {
      quest::say("Very well, a beastlord emblem and Druzzil's Mystical Sewing Kit. That will be 500 platinum please.");
	  quest:;setglobal("beastlord_emblem",1,7,"M30");
	}  
   elsif($text=~/plate/i && $ulevel >=50) {
      quest::say("Ahhhhh $name! The fine rigid armor that can stop a shaft from piercing yer heart! Too bad it be so cumbersome an' difficult t'move about in. To construct a piece o'plate armor, ye need t'combine a plate mold, an emblem, various amounts o'sheet metal an' use one o'those crafty Tanaan smithin' 'ammers all within a furnace touched by Ro. Ethereal metal sheet construction is another matter. Ye will need t'combine two bricks o'ethereal energy, an ethereal temper an' a Tanaan smithin' 'ammer within a Tanaan forge. I would seek a skilled craftsperson t'make the metal sheets fer ye; the emblem will enable ye t'craft the final armor piece no matter what yer skill be.");
	  quest::say("Ye realize, these here Emblems kin only be fer specific classes, so tell me which one ye be lookin' fer. Be it fer $Cleric, $Warrior, $Shadowknight, $Paladin or $Bard.");
	  quest::say("Or are ye back cuz ye got the $text4 emblem?");
	}
   elsif($text=~/Cleric/i && $ulevel >=50) {
      quest::say("Very well, a cleric emblem and furnace of Ro. That will be 500 platinum please.");
	  quest::setglobal("cleric_emblem",1,7,"M30");
	}  
	elsif($text=~/Warrior/i && $ulevel >=50) {
      quest::say("Very well, a warrior emblem and furnace of Ro. That will be 500 platinum please.");
	  quest:;setglobal("warrior_emblem",1,7,"M30");
	}  
	elsif($text=~/Shadowknight/i && $ulevel >=50) {
      quest::say("Very well, a shadowknight emblem and furnace of Ro. That will be 500 platinum please.");
	  quest::setglobal("shadowknight_emblem",1,7,"M30");
	}  
	elsif($text=~/Paladin/i && $ulevel >=50) {
      quest::say("Very well, a paladin emblem and furnace of Ro. That will be 500 platinum please.");
	  quest::setglobal("paladin_emblem",1,7,"M30");
	}  
	elsif($text=~/Bard/i && $ulevel >=50) {
      quest::say("Very well, a bard emblem and furnace of Ro. That will be 500 platinum please.");
	  quest::setglobal("bard_emblem",1,7,"M30");
	}  
   elsif($text=~/swatch/i && $ulevel >=50) {
      quest::say("T'make a swatch, ye need t'combine two strands o'ether along with a curing agent in a Tanaan loom. Ye will need t'seek a skilled brew master t'make the curing agent fer ye. Just 'ave them create it by using two celestial essences, soda an' paeala sap");
   }
   elsif($text=~/wrong/i && $ulevel >=50) {
      quest::say("Well make up yer mind will ya?, I will go broke if'n I have ta keep making these tings over fer free! Tell ya what, you take it up wit' th' wife overthere, she might be willing to swap wit' ye.");
      }
       else {
         quest::say("Ye look mighty inexperienced t'be in this area. $name. Come an' seek me out when ye 'ave more knowledge o'the planes!");
      }
  }  
sub EVENT_ITEM {
      if ($ulevel >= 50 && $qglobals{"warrior_emblem"} == 1 && ($platinum == 500)) {
		 quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
		 quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("warrior_emblem");
		}
	  elsif ($ulevel >= 50 && $qglobals{"cleric_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(16271);#Cleric Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
        quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("cleric_emblem");
      }
      elsif ($ulevel >= 50 && $qglobals{"paladin_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(16269);#Paladin Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("paladin_emblem");
      }
      elsif ($ulevel >= 50 && $qglobals{"ranger_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
        quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("ranger_emblem");
      }
      elsif ($ulevel >= 50 && $qglobals{"shadowknight_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("shadowknight_emblem");
      }
      elsif ($ulevel >= 50 && $qglobals{"druid_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
        quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("druid_emblem");
      }
      elsif ($ulevel >= 50 && $qglobals{"monk_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("monk_emblem");
      }
      elsif ($ulevel >= 50 && $qglobals{"bard_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("bard_emblem");
      }
      elsif ($ulevel >= 50 && $qglobals{"rogue_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("rogue_emblem");
      }
      elsif ($ulevel >= 50 && $qglobals{"shaman_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("shaman_emblem");
      }
      elsif ($ulevel >= 50 && $qglobals{"necromancer_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("necromancer_emblem");
      }
      elsif ($ulevel >= 50 && $qglobals{"wizard_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("wizard_emblem");
      }
      elsif ($ulevel >= 50 && $qglobals{"magician_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("magician_emblem");
      }
      elsif ($ulevel >= 50 && $qglobals{"enchanter_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("enchanter_emblem");
      }
      elsif ($ulevel >= 50 && $qglobals{"beastlord_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("beastlord_emblem");
      }
      elsif ($ulevel >= 50 && $qglobals{"berserker_emblem"} == 1 && ($platinum == 500)) {
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
        quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("berserker_emblem");
      }
	  else  {
	  quest::say("Huh? Cant't ye count? I asked fer 500 Platinum! But thanks fer th' donation!");
	     plugin::return_items(\%itemcount);
     
     }
   }

        
  

#END of FILE Zone:potranquility  ID:203064 -- Bor_Wharhammer
