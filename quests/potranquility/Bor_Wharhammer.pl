#Bor_Wharhammer.pl
#PoP quest armors

sub EVENT_SAY {
   my $cash;
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
   my $text5 = quest::saylink("Ranger", 1);
   my $text6 = quest::saylink("Rogue", 1);
   my $text7 = quest::saylink("Shaman", 1);
   my $text8 = quest::saylink("Berserker", 1);
   my $text9 = quest::saylink("Necromancer", 1);
   my $text10 = quest::saylink("Wizard", 1);
   my $text11 = quest::saylink("Magician", 1);
   my $text12 = quest::saylink("Enchanter", 1);
   my $text13 = quest::saylink("Druid", 1);
   my $text14 = quest::saylink("Monk", 1);
   my $text15 = quest::saylink("Beastlord", 1);
   my $text16 = quest::saylink("Cleric", 1);
   my $text17 = quest::saylink("Warrior", 1);
   my $text18 = quest::saylink("Shadowknight", 1);
   my $text19 = quest::saylink("Paladin", 1);
   my $text20 = quest::saylink("Bard", 1);
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
      quest::say("Ye realize, these here Emblems kin only be fer specific classes, so tell me which one ye be lookin' fer. Be it fer $text5, $text6, $text7 or $text8.");
	  quest::say("Or are ye back cuz ye got the $text1 emblem?");
	  quest::setglobal("create_emblem",1,7,"M30");
   }
   elsif($text=~/silk/i && $ulevel >=50) {
      quest::say("Har! It be quite funny that we be referin' t'silk as armor, fer the amount o'protection it provides be miniscule at best. The planar armor made from strands o'ether can still be quite useful fer its magical properties, 'owever. Ye will need t'take up a Tanaan embroidery needle, a pattern, an emblem an' various amounts o'ether silk swatches t'create a piece. Craft it all within a sewing kit boilin' with magical energy.");
	  quest::say("Ye realize, these here Emblems kin only be fer specific classes, so tell me which one ye be lookin' fer. Be it fer $text9, $text10, $text11 or $text12.");
	  quest::say ("Or are ye back cuz ye got the $text2 emblem?");
	  quest::setglobal("create_oemblem",1,7,"M30");
   }
   elsif($text=~/leather/i && $ulevel >=50) {
      quest::say("Leather armor provides little protection due t'the make-up o'the materials. We shall do our best, 'owever, t'see ye make a quality piece. T'do so, ye must combine a pattern, an emblem, various pieces o'cured ethereal energy an' a Tanaan embroidery needle all within a sewing kit boilin' with magical energy. The cured energy may be problematic fer an unskilled craftsman, 'owever. Just sew two silk ethereal swatches together using a Tanaan embroidery needle within a Tanaan loom. I can just imagine yer next question t'be about swatches, aye?");
	  quest::say("Ye realize, these here Emblems kin only be fer specific classes, so tell me which one ye be lookin' fer. Be it fer $text13, $text14 or $text15.");
	  quest::say("Or are ye back cuz ye got the $text3 emblem?");
	  quest::setglobal("create_emblem",1,7,"M30");
   }
   elsif($text=~/plate/i && $ulevel >=50) {
      quest::say("Ahhhhh $name! The fine rigid armor that can stop a shaft from piercing yer heart! Too bad it be so cumbersome an' difficult t'move about in. To construct a piece o'plate armor, ye need t'combine a plate mold, an emblem, various amounts o'sheet metal an' use one o'those crafty Tanaan smithin' 'ammers all within a furnace touched by Ro. Ethereal metal sheet construction is another matter. Ye will need t'combine two bricks o'ethereal energy, an ethereal temper an' a Tanaan smithin' 'ammer within a Tanaan forge. I would seek a skilled craftsperson t'make the metal sheets fer ye; the emblem will enable ye t'craft the final armor piece no matter what yer skill be.");
	  quest::say("Ye realize, these here Emblems kin only be fer specific classes, so tell me which one ye be lookin' fer. Be it fer $text16, $text17, $text18, $text19 or $text20.");
	  quest::say("Or are ye back cuz ye got the $text4 emblem?");
	  quest::setglobal("create_emblem",1,7,"M30");
   }
   elsif($text=~/swatch/i && $ulevel >=50) {
      quest::say("T'make a swatch, ye need t'combine two strands o'ether along with a curing agent in a Tanaan loom. Ye will need t'seek a skilled brew master t'make the curing agent fer ye. Just 'ave them create it by using two celestial essences, soda an' paeala sap");
   }
   elsif($text=~/wrong/i && $ulevel >=50) {
      quest::say("Well make up yer mind will ya?, I will go broke if'n I have ta keep making these tings over fer free! OK just dis once, tell me what kind of emblem you want den hand the old ones back t' me. and I will exchange dem fer ye.");
      quest::say("Well? Which one does ye want? $Ranger, $Rogue, $Shaman, $Berserker, $Necromancer, $Wizard, $Magician, $Enchanter, $Druid, $Monk, $Beastlord, $Cleric, $Warrior, $Shadowknight, $Paladin or $Bard?");
	  quest::setglobal("exchange_container",1,7,"M30");  
   }
   else {
         quest::say("Ye look mighty inexperienced t'be in this area. $name. Come an' seek me out when ye 'ave more knowledge o'the planes!");
      }
  }  
sub EVENT_ITEM {
    if($ulevel >= 50 && defined($qglobals{create_emblem} && ($platinum == 500))) {
        if ($text=~/Warrior/i) {
		quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
		 quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
		}
	  elsif($text=~/Cleric/i) {
         quest::summonitem(16271);#Cleric Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
        quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
      elsif($text=~/Paladin/i) {
         quest::summonitem(16269);#Paladin Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
      elsif($text=~/Ranger/i) {
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
        quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
      elsif($text=~/Shadowknight/i) {
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
      elsif($text=~/Druid/i) {
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
        quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
      elsif($text=~/Monk/i) {
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
      elsif($text=~/Bard/i) {
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
      elsif($text=~/Rogue/i) {
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
      elsif($text=~/Shaman/i) {
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
      elsif($text=~/Necromancer/i) {
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
      elsif($text=~/Wizard/i) {
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
      elsif($text=~/Magician/i) {
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
      elsif($text=~/Enchanter/i) {
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
      elsif($text=~/Beastlord/i) {
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
      elsif($text=~/Berserker/i) {
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
        quest::say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  else {
	  quest::say("Huh?");}
	 }
   }
   if($ulevel >= 50 && defined($qglobals{exchange_container})) {
       if($text=~/Warrior/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) {
	   #turn in cleric emblem and furnace for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Warrior/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	  #turn in paladin emblem and furnace for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Warrior/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	  #turn in ranger emblem and furnace for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Warrior/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	  #turn in shadowknight emblem and furnace for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Warrior/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	  #turn in druid emblem and sewing kit for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Warrior/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	  #turn in monk emblem and sewing kit for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Warrior/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	  #turn in bard emblem and furnace for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Warrior/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Warrior/i && plugin::check_handin(\%itemcount, 16274 => 1 && 17184 => 1 )) { 
	  #turn in shaman emblem and furnace for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Warrior/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	  #turn in necromancer emblem and sewing kit for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Warrior/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	  #turn in wizard emblem and sewing kit for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Warrior/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	  #turn in magician emblem and sewing kit for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Warrior/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	  #turn in enchanter emblem and sewing kit for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Warrior/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	  #turn in beastlord emblem and sewing kit for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Warrior/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	  #turn in beserker emblem and furnace for warrior emblem and furnace
         quest::summonitem(16267);#Warrior Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	   #turn in warrior emblem and furnace for cleric emblem and furnace
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	   #turn in paladin emblem and furnace for cleric emblem and furnace
        quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	   #turn in ranger emblem and furnace for cleric emblem and furnace
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	   #turn in shadowknight emblem and furnace for cleric emblem and furnace
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	   #turn in druid emblem and sewing kit for cleric emblem and furnace
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	   #turn in monk emblem and sewing kit for cleric emblem and furnace
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	   #turn in bard emblem and furnace for cleric emblem and furnace
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	   #turn in rogue emblem and furnace for cleric emblem and furnace
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 16274 => 1 && 17184 => 1 )) { 
	   #turn in shaman emblem and furnace for cleric emblem and furnace
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	   #turn in necromancer emblem and sewing kit for cleric emblem and furnace
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	  
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	   #turn in wizard emblem and sewing kit for cleric emblem and furnace
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	   #turn in magician emblem and sewing kit for cleric emblem and furnace
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	   #turn in enchanter emblem and sewing kit for cleric emblem and furnace
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	   #turn in beastlord emblem and sewing kit for cleric emblem and furnace
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	
	   elsif($text=~/Cleric/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	   #turn in beserker emblem and furnace for cleric emblem and furnace
	    quest::summonitem(16271);#Cleric Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
		quest::delglobal("trade_ornate_emblem_and_container");
	  }	
       elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	   #turn in warrior emblem and furnace for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) { 
	  #turn in cleric emblem and furnace for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	  #turn in ranger emblem and furnace for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	  #turn in shadowknight emblem and furnace for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	  #turn in druid emblem and sewing kit for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	  #turn in monk emblem and sewing kit for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	  #turn in bard emblem and furnace for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 16274 => 1 && 17184 => 1 )) { 
	  #turn in shaman emblem and furnace for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	  #turn in necromancer emblem and sewing kit for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	  #turn in wizard emblem and sewing kit for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	  #turn in magician emblem and sewing kit for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	  #turn in enchanter emblem and sewing kit for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	  #turn in beastlord emblem and sewing kit for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Paladin/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	  #turn in beserker emblem and furnace for paladin emblem and furnace
	    quest::summonitem(16269);#Paladin Emblem
        quest::summonitem(17184);#Mystical Furnace of Ro
        quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	  #turn in warrior emblem and furnace for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) { 
	  #turn in cleric emblem and furnace for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	  #turn in paladin emblem and furnace for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	  #turn in shadowknight emblem and furnace for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	  #turn in druid emblem and sewing kit for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	  #turn in monk emblem and sewing kit for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	  #turn in bard emblem and furnace for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 16274 => 1 && 17184 => 1 )) { 
	  #turn in shaman emblem and furnace for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	  #turn in necromancer emblem and sewing kit for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	  #turn in wizard emblem and sewing kit for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	  #turn in magician emblem and sewing kit for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	  #turn in enchanter emblem and sewing kit for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	  #turn in beastlord emblem and sewing kit for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Ranger/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	  #turn in beserker emblem and furnace for ranger emblem and furnace
         quest::summonitem(16272);#Ranger Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) { 
	  #turn in cleric emblem and furnace for shadowknight emblem and furnace
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	  #turn in warrior emblem and furnace for shadowknight emblem and furnace) 
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	  #turn in paladin emblem and furnace for shadowknight emblem and furnace
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	  #turn in ranger emblem and furnace for shadowknight emblem and furnace
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	  #turn in druid emblem and sewing kit for shadowknight emblem and furnace
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) {
	  #turn in monk emblem and sewing kit for shadowknight emblem and furnace
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	  #turn in bard emblem and furnace for shadowknight emblem and furnace
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for shadowknight emblem and furnace
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 16274 => 1 && 17184 => 1 )) { 
	  #turn in shaman emblem and furnace for shadowknight emblem and furnace
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	  #turn in necromancer emblem and sewing kit for shadowknight emblem and furnace
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	  #turn in wizard emblem and sewing kit for shadowknight emblem and furnace
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) {
	  #turn in magician emblem and sewing kit for shadowknight emblem and furnace
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	  #turn in enchanter emblem and sewing kit for shadowknight emblem and furnace
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	  #turn in beastlord emblem and sewing kit for shadowknight emblem and furnace
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Shadowknight/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	  #turn in beserker emblem and furnace for shadowknight emblem and furnace
         quest::summonitem(16270);#Shadowknight Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) { 
	  #turn in cleric emblem and furnace for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	  #turn in warrior emblem and furnace for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	  #turn in paladin emblem and furnace for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	  #turn in ranger emblem and furnace for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	  #turn in shadowknight emblem and furnace for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	  #turn in monk emblem and sewing kit for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	  #turn in bard emblem and furnace for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 16274 => 1 && 17184 => 1 )) { 
	  #turn in shaman emblem and furnace for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	  #turn in necromancer emblem and sewing kit for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	  #turn in wizard emblem and sewing kit for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	  #turn in magician emblem and sewing kit for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	  #turn in enchanter emblem and sewing kit for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	  #turn in beastlord emblem and sewing kit for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Druid/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	  #turn in beserker emblem and furnace for druid emblem and sewing kit
         quest::summonitem(16276);#Druid Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) { 
	  #turn in cleric emblem and furnace for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	  #turn in warrior emblem and furnace for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	  #turn in paladin emblem and furnace for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	  #turn in ranger emblem and furnace for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	  #turn in shadowknight emblem and furnace for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) {
	  #turn in druid emblem and sewing kit for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	  #turn in bard emblem and furnace for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 16274 => 1 && 17184 => 1 )) { 
	  #turn in shaman emblem and furnace for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	  #turn in necromancer emblem and sewing kit for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	  #turn in wizard emblem and sewing kit for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	  #turn in magician emblem and sewing kit for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	  #turn in enchanter emblem and sewing kit for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	  #turn in beastlord emblem and sewing kit for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Monk/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	  #turn in beserker emblem and furnace for monk emblem and sewing kit
         quest::summonitem(16275);#Monk Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	  #turn in warrior emblem and furnace for bard emblem and furnace
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) { 
	  #turn in cleric emblem and furnace for bard emblem and furnace
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	  #turn in paladin emblem and furnace for bard emblem and furnace
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	  #turn in ranger emblem and furnace for bard emblem and furnace
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	  #turn in shadowknight emblem and furnace for bard emblem and furnace
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	  #turn in druid emblem and sewing kit for bard emblem and furnace
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	  #turn in monk emblem and sewing kit for bard emblem and furnace
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for bard emblem and furnace 
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16274 => 1 && 17184 => 1 )) { 
	  #turn in shaman emblem and furnace for bard emblem and furnace 
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	  #turn in necromancer emblem and sewing kit for bard emblem and furnace 
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	  #turn in wizard emblem and sewing kit for bard emblem and furnace 
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	  #turn in magician emblem and sewing kit for bard emblem and furnace 
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	  #turn in warrior emblem and furnace for bard emblem and furnace
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	  #turn in enchanter emblem and sewing kit for bard emblem and furnace 
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	  #turn in beastlord emblem and sewing kit for bard emblem and furnace
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	   elsif($text=~/Bard/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	   #turn in beserker emblem and furnace for bard emblem and furnace
         quest::summonitem(16268);#Bard Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("create_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	  #turn in warrior emblem and furnace for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) { 
	  #turn in cleric emblem and furnace for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	  #turn in paladin emblem and furnace for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	  #turn in ranger emblem and furnace for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	  #turn in shadowknight emblem and furnace for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	  #turn in druid emblem and sewing kit for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	  #turn in bard emblem and furnace for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	  #turn in monk emblem and sewing kit for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 16274 => 1 && 17184 => 1 )) { 
	  #turn in shaman emblem and furnace for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	  #turn in necromancer emblem and sewing kit for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	  #turn in wizard emblem and sewing kit for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	  #turn in magician emblem and sewing kit for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	  #turn in enchanter emblem and sewing kit for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	  #turn in beastlord emblem and sewing kit for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Rogue/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	  #turn in beserker emblem and furnace for rogue emblem and furnace
         quest::summonitem(16273);#Rogue Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	  #turn in warrior emblem and furnace for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) { 
	  #turn in cleric emblem and furnace for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	  #turn in paladin emblem and furnace for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	  #turn in ranger emblem and furnace for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	  #turn in shadowknight emblem and furnace for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	  #turn in druid emblem and sewing kit for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	  #turn in bard emblem and furnace for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	  #turn in monk emblem and sewing kit for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	  #turn in necromancer emblem and sewing kit for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	  #turn in wizard emblem and sewing kit for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	  #turn in magician emblem and sewing kit for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	  #turn in enchanter emblem and sewing kit for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	  #turn in beastlord emblem and sewing kit for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Shaman/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	  #turn in beserker emblem and furnace for shaman emblem and furnace
         quest::summonitem(16274);#Shaman Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	  #turn in warrior emblem and furnace for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) { 
	  #turn in cleric emblem and furnace for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	  #turn in paladin emblem and furnace for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	  #turn in ranger emblem and furnace for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	  #turn in shadowknight emblem and furnace for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	  #turn in druid emblem and sewing kit for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	  #turn in bard emblem and furnace for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	  #turn in monk emblem and sewing kit for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	  #turn in wizard emblem and sewing kit for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	  #turn in magician emblem and sewing kit for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	  #turn in enchanter emblem and sewing kit for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	  #turn in beastlord emblem and sewing kit for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Necromancer/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	  #turn in beserker emblem and furnace for necromancer emblem and sewing kit
         quest::summonitem(16278);#Necromancer Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	  #turn in warrior emblem and furnace for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) { 
	  #turn in cleric emblem and furnace for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	  #turn in paladin emblem and furnace for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	  #turn in ranger emblem and furnace for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	  #turn in shadowknight emblem and furnace for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	  #turn in druid emblem and sewing kit for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	  #turn in bard emblem and furnace for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	  #turn in monk emblem and sewing kit for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	  #turn in necromancer emblem and sewing kit for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	  #turn in magician emblem and sewing kit for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	  #turn in enchanter emblem and sewing kit for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	  #turn in beastlord emblem and sewing kit for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Wizard/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	  #turn in beserker emblem and furnace for wizard emblem and sewing kit
         quest::summonitem(16279);#Wizard Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	  #turn in warrior emblem and furnace for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) { 
	  #turn in cleric emblem and furnace for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	  #turn in paladin emblem and furnace for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	  #turn in ranger emblem and furnace for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	  #turn in shadowknight emblem and furnace for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	  #turn in druid emblem and sewing kit for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	  #turn in bard emblem and furnace for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	  #turn in monk emblem and sewing kit for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	  #turn in necromancer emblem and sewing kit for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	  #turn in wizard emblem and sewing kit for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	  #turn in enchanter emblem and sewing kit for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	  #turn in beastlord emblem and sewing kit for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Magician/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	  #turn in beserker emblem and furnace for magician emblem and sewing kit
         quest::summonitem(16280);#Magician Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	  #turn in warrior emblem and furnace for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) { 
	  #turn in cleric emblem and furnace for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	  #turn in paladin emblem and furnace for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	  #turn in ranger emblem and furnace for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	  #turn in shadowknight emblem and furnace for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	  #turn in druid emblem and sewing kit for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	  #turn in bard emblem and furnace for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	  #turn in monk emblem and sewing kit for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	  #turn in necromancer emblem and sewing kit for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	  #turn in wizard emblem and sewing kit for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	  #turn in magician emblem and sewing kit for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	  #turn in beastlord emblem and sewing kit for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Enchanter/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	  #turn in beserker emblem and furnace for enchanter emblem and sewing kit
         quest::summonitem(16281);#Enchanter Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	  #turn in warrior emblem and furnace for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) { 
	  #turn in cleric emblem and furnace for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	  #turn in paladin emblem and furnace for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	  #turn in ranger emblem and furnace for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	  #turn in shadowknight emblem and furnace for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	  #turn in druid emblem and sewing kit for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	  #turn in bard emblem and furnace for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	  #turn in monk emblem and sewing kit for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	  #turn in necromancer emblem and sewing kit for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	  #turn in wizard emblem and sewing kit for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	  #turn in magician emblem and sewing kit for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	  #turn in enchanter emblem and sewing kit for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Beastlord/i && plugin::check_handin(\%itemcount, 32000 => 1 && 17184 => 1 )) { 
	  #turn in beserker emblem and furnace for beastlord emblem and sewing kit
         quest::summonitem(16277);#Beastlord Emblem
         quest::summonitem(17185);#Druzzil's Mystical Sewing Kit
         quest::delglobal("trade_ornate_emblem_and_container");
      }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16267 => 1 && 17184 => 1 )) { 
	  #turn in warrior emblem and furnace for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16271 => 1 && 17184 => 1 )) { 
	  #turn in cleric emblem and furnace for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16269 => 1 && 17184 => 1 )) { 
	  #turn in paladin emblem and furnace for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16272 => 1 && 17184 => 1 )) { 
	  #turn in ranger emblem and furnace for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16270 => 1 && 17184 => 1 )) { 
	  #turn in shadowknight emblem and furnace for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16276 => 1 && 17185 => 1 )) { 
	  #turn in druid emblem and sewing kit for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16268 => 1 && 17184 => 1 )) { 
	  #turn in bard emblem and furnace for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16275 => 1 && 17185 => 1 )) { 
	  #turn in monk emblem and sewing kit for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16278 => 1 && 17185 => 1 )) { 
	  #turn in necromancer emblem and sewing kit for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16279 => 1 && 17185 => 1 )) { 
	  #turn in wizard emblem and sewing kit for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16280 => 1 && 17185 => 1 )) { 
	  #turn in magician emblem and sewing kit for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16281 => 1 && 17185 => 1 )) { 
	  #turn in enchanter emblem and sewing kit for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16277 => 1 && 17185 => 1 )) { 
	  #turn in beastlord emblem and sewing kit for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	  elsif($text=~/Berserker/i && plugin::check_handin(\%itemcount, 16273 => 1 && 17184 => 1 )) { 
	  #turn in rogue emblem and furnace for berserker emblem and furnace
         quest::summonitem(32000);#Berserker Emblem
         quest::summonitem(17184);#Mystical Furnace of Ro
         quest::delglobal("trade_ornate_emblem_and_container");
	  }
	 
      else {
         quest::say("Eh? Say again?");
      }
   }

        
  

#END of FILE Zone:potranquility  ID:203064 -- Bor_Wharhammer
