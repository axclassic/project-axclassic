######################################
## NPC: Band the Ranger             ##
## Zone: All Starter Zones          ##
## EQWorld Server 19-12-2010        ##
## By: Angelox                      ##
## Revised by Caved for Clinklinks  ##
## Second revision by EQPlayer 	    ##
## UPDATE 2/8/16 Fixed and cleanup  ##
## variables now within subroutines ##
######################################
## Further Notes:
## Ranger Band will now let you know if an Event is active.
## Also, he will speak to you relating to the events currently going on.
## Event5 is the Random moonstone Event, but has been implemented to only be active
## if you are currently participating in the Ladder Rankings. Otherwise, you have
## to hunt for the moonstones yourself - Patrik.
## UPDATE- SAYLINKS placed back in subroutines!

$minCharID  = 5829; # 5829 Ladder info

sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}
sub EVENT_ENTER {
$npc->SetAppearance(0); # Stands up
my $random_result = int(rand(227));
my $random_result2 = int(rand(150));
#Events
my $tevent1 = quest::saylink("New Years", 1);
my $tevent2 = quest::saylink("Easter", 1);
my $tevent3 = quest::saylink("Bloodhunt", 1);
#my $tevent4 = quest::saylink("Pitch Black Event", 1);
#my $tevent5 = quest::saylink("Random Moonstone Event", 1);
my $tevent6 = quest::saylink("Christmas", 1);
my $najena = quest::saylink("Najena", 1);
my $fishbone = quest::saylink("fishbone", 1);
my $warrens = quest::saylink("The Warrens", 1);
my $bow = quest::saylink("bow", 1);
my $ogres = quest::saylink("ogres", 1);
my $everfrost = quest::saylink("Everfrost", 1);
my $caverns = quest::saylink("caverns", 1);
my $tower = quest::saylink("Tower of Frozen Shadow", 1);
my $dagnors = quest::saylink("Dagnors Caundron", 1);
my $night = quest::saylink("night", 1);
my $oot = quest::saylink("Ocean of Tears", 1);
my $gunthak = quest::saylink("Gunthak", 1);
my $friends = quest::saylink("friends", 1);
my $droga = quest::saylink("Temple of Droga", 1);
my $toxxulia = quest::saylink("Toxxulia Forest", 1);
my $croc = quest::saylink("crocodile", 1);
my $dream = quest::saylink("dream", 1);

	#EVENT responses
	if(($ulevel <= 3) && ($random_result2 <= 25)) {
       $client->Message(14,"Ranger Band says, '$name! Have you gotten your first bot (helper NPC) yet? Turn around and head back into the city, 
	   use your FIND button and look for Aediles Thrall. He will want to speak with you. He'll help you set up your Bots.'"); }
    elsif(($ulevel <= 5) && ($random_result2 <= 50) && ($zoneid != 165)) {
       $client->Message(14,"Ranger Band says, 'If you wish to travel to Shadweavers Thicket I can help you. Meet me near the bank there and I will tell you more...'"); }
    elsif(($random_result2 <= 75) && ($event1==1)) {
       $client->Message(14,"Ranger Band says, 'Happy New Year $name!'"); }
    elsif(($random_result2 <= 75) && ($event2==1)) {
       $client->Message(14,"Ranger Band says, 'Happy Easter $name!'"); }
    #if(($random_result2 <= 75) && ($event3==1)) { #Bloodhunt Event
       #$client->Message(14,"Ranger Band says, 'Countess Zellia can be found around here at night.'"); }
    #if(($random_result2 <= 75) && ($event4==1)) {
	   #$client->Message(14,"Ranger Band says, 'Better head to Ocean of Tears if you want to see something that is unexplainable! Stay off of the piers there, you have been forewarned.'"); } 
	elsif(($random_result2 <= 75) && ($event6==1)) {
       $client->Message(14,"Ranger Band says, 'Merry Xmas $name!'"); } 
	else {
	#Do nothing
	} #End EVENT responses
   
	#IF EVENT IS ACTIVE AND UP
	if(($event1 == 1) && ($ulevel <= 10)) {
	$client->Message(14, "Ranger Band says, 'It looks as if a $tevent1 Event is going on! Remember, this is active for level 10 and below.'"); }
	elsif($event2 == 1) {
	$client->Message(14, "Ranger Band says, 'It looks as if an $tevent2 Event is going on! This event has no level restrictions.'"); }
	elsif($event3 == 1) {
	$client->Message(14, "Ranger Band says, 'It looks as if a $tevent3 Event is going on! This event has no level restrictions.'"); }
	elsif($event4 == 1) {
	$client->Message(14, "Ranger Band says, 'It looks as if a Pitch Black Event is going on!
	 Better head to Ocean of Tears if you want to see something unexplainable! If you do,
	 stay away from the piers there, you have been forewarned.'"); }
	elsif($event5 == 1) {
	$client->Message(14, "Ranger Band says, 'It looks as if the Random moonstone Event is going on! Remember, this is only active for Ladder participants who are level 20 and below.'"); }
	elsif($event6 == 1) {
	$client->Message(14, "Ranger Band says, 'It looks as if a $tevent6 Event is going on! This event has no level restrictions.'"); }
	else {
	#Do Nothing
	}

	if($random_result <= 185){ # 40=26% 113=75% chance of saying something when near
	  #$client->Message(14, "random result was $random_result.");
        if($random_result <= 10){
		  $client->Message(14,"Ranger Band says, 'There was a time when I camped in $najena for the Journeyman Boots...'"); }
		elsif($random_result <= 20){
		  $client->Message(14,"Ranger Band says, 'The $fishbone earring was my first item for underwater breathing.'"); }
		elsif($random_result <= 30){
		  $client->Message(14,"Ranger Band says, 'Once I saw a tiny dragon living in a small pool while in $warrens.'"); }
		elsif($random_result <= 40){
		  $client->Message(14,"Ranger Band says, 'South Karana is one of my favorite hunting grounds, I got my first decent $bow there...'"); }
		elsif($random_result <= 50){
		  $client->Message(14,"Ranger Band says, 'Once we camped some $ogres in West Karana...'"); }
		elsif($random_result <= 60){
		  $client->Message(14,"Ranger Band says, 'I found the strangest item while hunting in $everfrost.'"); }
		elsif($random_result <= 70){
		  $client->Message(14,"Ranger Band says, 'I once found an entrance to to some $caverns by Ry'Gorr fort in Eastern Wastes.'"); }
		elsif($random_result <= 80){
		  $client->Message(14,"Ranger Band says, 'I remember the time we camped for Tserrina's Robe in $tower.'"); }
		elsif($random_result <= 90){
		  $client->Message(14,"Ranger Band says, 'Ever been to $dagnors?'"); }
		elsif($random_result <= 100){
		  $client->Message(14,"Ranger Band says, 'Don't let the $night catch you in Lake Rathe!'"); }
		elsif($random_result <= 110){
			 if ($event4==1) {#Pitch Black Event
			  $client->Message(14,"Ranger Band says, '2:00am in $oot is called the witching hour, you better not be there if you're not ready!'");}
			 else {
			  $client->Message(14,"Ranger Band says, 'Beware of the Werewolves at night!'"); }
		}
		elsif($random_result <= 120){
		   $client->Message(14,"Ranger Band says, 'The Pirates of $gunthak bore many treasures.'"); }
		elsif($random_result <= 130){
		   $client->Message(14,"Ranger Band says, 'Did I tell you how I made $friends with the frog people?'"); }
		elsif($random_result <= 140){
		   $client->Message(14,"Ranger Band says, 'Funny thing I noticed about $droga was that when I went there after level 45, 
		   all the monsters had changed and the loots were new!'"); }
		elsif($random_result <= 150){
		   $client->Message(14,"Ranger Band says, 'Have you found the new caves in $toxxulia yet?'"); }
		elsif($random_result <= 165){
		   $client->Message(14,"Ranger Band says, 'Lockjaw wasn't the only monster $croc I found while exploring Oasis of Marr.'"); }
		elsif($random_result <= 180){
		   $client->Message(14,"Ranger Band says, 'Did I tell you about this lady's terrifying $dream?'"); }
		else {
		  #Do Nothing 
		}
	} else {
	#Do Nothing for now
	}
	
##Countess Event
 if ($event3==1) {
   if (($countess1!=1) && ($zoneid == 2) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(1310,0,0,162,468,3.1,161);
      }
   elsif (($countess2!=1) && ($zoneid == 3) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(3062,0,0,50,36,3.1,76);
      }
   elsif (($countess3!=1) && ($zoneid == 9) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(9161,0,0,-77,-35,-25,55);
      }
   elsif (($countess4!=1) && ($zoneid == 10) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(10202,0,0,-732,-237,-53,51);
      }
   elsif (($countess5!=1) && ($zoneid == 19) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(19155,0,0,-81,-37,3.1,218);
      $countess5=1;}
   elsif (($countess6!=1) && ($zoneid == 25) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(25209,0,0,-961,2193,-3,60);
      }
   elsif (($countess7!=1) && ($zoneid == 30) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(30145,0,0,641,3233,-61.2,182);
      }
   elsif (($countess8!=1) && ($zoneid == 38) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(38212,0,0,173,2175,-46,39);
      }
   elsif (($countess9!=1) && ($zoneid == 49) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(49135,0,0,526,254,59,137);
      }
   elsif (($countess10!=1) && ($zoneid == 54) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(54290,0,0,157,119,4.1,64);
      }
   elsif (($countess11!=1) && ($zoneid == 61) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(61097,0,0,16,35,3.1,118);
      }
   elsif (($countess12!=1) && ($zoneid == 68) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(68315,0,0,-358,2806,3.6,242);
      }
   elsif (($countess13!=1) && ($zoneid == 78) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(78214,0,0,2590,-2101,26,1);
      }
   elsif (($countess14!=1) && ($zoneid == 83) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(83345,0,0,-2050,-1091,3,168);
      }
   elsif (($countess15!=1) && ($zoneid == 165) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(165321,0,0,-2884,-1710,-214,29);
      }
   elsif (($countess16!=1) && ($zoneid == 189) && ((($zonetime >= 0)&&($zonetime <= 800)) | (($zonetime >= 2000)&&($zonetime <= 2359)))){
      quest::unique_spawn(189999,0,0,22,48,12,152);
      }
  }
  
}#End sub EVENT_ENTER
	
sub EVENT_EXIT {
my $random_result2 = int(rand(100));
$npc->SetAppearance(1); # Sits down

	if($random_result2 <= 25) {
		$client->Message(4, "Ranger Band acknowledges your presence and watches your every move."); }
}#End sub EVENT_EXIT

sub EVENT_SAY {
my $random_result3 = int(rand(170));

my $btevent1 = quest::saylink("New Years", 1);
my $btevent2 = quest::saylink("Easter", 1);
my $btevent3 = quest::saylink("Bloodhunt", 1);
#my $tevent4 = quest::saylink("Pitch Black Event", 1);
#my $tevent5 = quest::saylink("Random Moonstone Event", 1);
my $btevent6 = quest::saylink("Christmas", 1);
my $bnajena = quest::saylink("Najena", 1);
my $bfishbone = quest::saylink("fishbone", 1);
my $bwarrens = quest::saylink("The Warrens", 1);
my $bbow = quest::saylink("bow", 1);
my $bogres = quest::saylink("ogres", 1);
my $beverfrost = quest::saylink("Everfrost", 1);
my $bcaverns = quest::saylink("caverns", 1);
my $btower = quest::saylink("Tower of Frozen Shadow", 1);
my $bdagnors = quest::saylink("Dagnors Caundron", 1);
my $bnight = quest::saylink("night", 1);
my $boot = quest::saylink("Ocean of Tears", 1);
my $bgunthak = quest::saylink("Gunthak", 1);
my $bfriends = quest::saylink("friends", 1);
my $bdroga = quest::saylink("Temple of Droga", 1);
my $btoxxulia = quest::saylink("Toxxulia Forest", 1);
my $bcroc = quest::saylink("crocodile", 1);
my $bdream = quest::saylink("dream", 1);

my $shadeweaver = quest::saylink("Shadeweaver's Thicket", 1);
#my $newyear = quest::saylink("New Year", 1);
my $easter = quest::saylink("Easter", 1);
my $different = quest::saylink("different", 1);
my $traveled = quest::saylink("traveled", 1);
my $buffs = quest::saylink("buffs", 1);
#Ranger Band Saystuff starts here
my $minions = quest::saylink("minions", 1);
my $key = quest::saylink("key", 1);
my $fabled = quest::saylink("Fabled", 1);
my $only = quest::saylink("only", 1);
my $quillmane = quest::saylink("Quillmane", 1);
my $chief = quest::saylink("Chief", 1);
my $prize = quest::saylink("prize", 1);
my $kithicor = quest::saylink("Kithicor Forest", 1);
my $pirates = quest::saylink("pirates", 1);
my $treasure = quest::saylink("treasure", 1);
my $skeletons = quest::saylink("Skeletons", 1);
my $activeYear = 2020;
my $moonstone = quest::saylink("moonstone", 1);
my $shadeweavers = quest::saylink("Shadeweavers Thicket", 1);
my $transport = quest::saylink("transport", 1);
my $sword = quest::saylink("sword", 1);
my $wind = quest::saylink("Wind", 1);
my $legendary = quest::saylink("legendary", 1);
my $interest = quest::saylink("interest", 1);
my $tempt = quest::saylink("tempt", 1);

#Randomized and make animations not always happen, so they seem more natural 
	if ($random_result3 <= 20){ 
	    $npc->DoAnim(8, 48); #nod
	    }
	elsif ($random_result3 <= 40){
	    $npc->DoAnim(8, 31);#yawn
	    }
	elsif ($random_result3 <= 50){
	    $npc->DoAnim(8, 64);#point
	    }
	elsif ($random_result3 <= 60){
	    $npc->DoAnim(8, 55); #cough
	    }
	elsif ($random_result3 <= 80){
	    $npc->DoAnim(8, 65); #shrug
	    }
	elsif ($random_result3 <= 100){
	    $npc->DoAnim(8, 77);#smile
	    }
	elsif ($random_result3 <= 120){
	    $npc->DoAnim(8, 77);#sigh
	    }

	if($text=~/Hail/i) {
        if(($ulevel <= 10) && ($event1 == 1)) {
			$client->Message(14,"Ranger Band says, 'Happy $btevent1 $name, I have $traveled many lands, seen many things, if you're interested, I can tell you of them.'"); }
        elsif($event2 == 1){
			$client->Message(14,"Ranger Band says, 'Happy $btevent2 $name, I have $traveled many lands, seen many things, if you're interested, I can tell you of them.'"); }
        elsif(($ulevel <= 20) && ($event5 == 1) && ($charid > $minCharID)){ #Must have Ladder check here
			$client->Message(14,"Ranger Band says, '$name! Have you been looking for faster ways to travel? If so, I have some rare items that might $interest you.'"); }
		elsif($event6 == 1) {
		    $client->Message(14,"Ranger Band says, 'Merry $btevent6 $name, I have $traveled many lands, seen many things, if you're interested, I can tell you of them.'"); }
		else{ 
			$client->Message(14,"Ranger Band says, 'Well met $name, I have $traveled many lands, seen many things, if you're interested, I can tell you of them.'"); }
            #$client->Message(14,"Ranger Band says, 'Feel free to ask me of my $travels many times, as I carry much information.'");
            $client->Message(14,"Ranger Band says, 'I also have Ranger $buffs if you're interested.'");
			if($zoneid == 165) {
				$client->Message(14,"Ranger Band says, 'I see you made it to $shadeweavers.'"); }
	}
#Ranger Band Saystuff starts here
	if(($text=~/traveled/i) && ($random_result3 <= 10)){
	  $client->Message(14,"Ranger Band says, 'There was a time when I camped in $bnajena for the Journeyman Boots.'"); }
	elsif($text=~/Najena/i){
	  $client->Message(14,"Ranger Band says, 'Aye Najena's dungeon. She and her $minions can put up an interesting fight.'"); }
	elsif($text=~/minions/i){
	  $client->Message(14,"Ranger Band says, 'Drelzna is the one who has the Journeyman boots, but you will need to find the $key to her room.'"); }
	elsif($text=~/key/i){
	  $client->Message(14,"Ranger Band says, 'You need three keys to get there, Rathyl holds the one you need...'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 20)){
	  $client->Message(14,"Ranger Band says, 'The $bfishbone earring was my first item for underwater breathing.'"); }
	elsif($text=~/fishbone/i){
	  $client->Message(14,"Ranger Band says, 'I found mine on a barbarian that lives near a lake in Qeynos Hills.'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 30)){
	  $client->Message(14,"Ranger Band says, 'Once I saw a tiny dragon living in a small pool while in The $bwarrens.'"); }
	elsif($text=~/warrens/i){
	  $client->Message(14,"Ranger Band says, 'His name is Muglwump, and he's a Shaman with an attitude. You can get to Warrens via Paineel.'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 40)){
	  $client->Message(14,"Ranger Band says, 'South Karana is one of my favorite hunting grounds, I got my first decent $bbow there!'"); }
	elsif($text=~/bow/i){
	  $client->Message(14,"Ranger Band says, 'An angry centaur goes by the name of Coloth Meadowgreen who had that bow. But beware of The $fabled Coloth! He is much stronger.'"); }
	elsif($text=~/fabled/i){
	  $client->Message(14,"Ranger Band says, 'Aye, fabled with a Fabled Bow! He's not the $only fabled minion in South Karana...'"); }
	elsif($text=~/only/i){
	  $client->Message(14,"Ranger Band says, 'Well, there's also the Fabled $quillmane and the Fabled Grizzleknot.'"); }
	elsif($text=~/quillmane/i){
	  $client->Message(14,"Ranger Band says, 'Quilmane is the prettiest horse in all of Norrath. Once I heard he flew across the plains of Karana shorter than a hummingbird's breath!'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 50)){
	  $client->Message(14,"Ranger Band says, 'Once we camped some $bogres in West Karana...'"); }
	elsif($text=~/ogres/i){
	  $client->Message(14,"Ranger Band says, 'Aye, Ogres. They were nice to us until we started killing them, specially $chief Goonda.'"); }
	elsif($text=~/chief/i){
	  $client->Message(14,"Ranger Band says, 'He gets real ornary when he gets mad, and the Fabled Chief is worse than him!'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 60)){
	  $client->Message(14,"Ranger Band says, 'I found the strangest item while hunting in $beverfrost.'"); }
	elsif($text=~/everfrost/i){
	  $client->Message(14,"Ranger Band says, 'Aye, it was at some gobbie camps on my way to the frozen river - helped lighten my load.'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 70)){
	  $client->Message(14,"Ranger Band says, 'I once found an entrance to to some $bcaverns by the Ry'Gorr fort in Eastern Wastes.'"); }
	elsif($text=~/caverns/i){
	  $client->Message(14,"Ranger Band says, 'They are known as Crystal Caverns, The citizens of Froststone still have a small outpost in there. There's crystal spiders, geonids, stalag terrors, and more.'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 80)){
	  $client->Message(14,"Ranger Band says, 'I remember the time we camped for the Tserrina's Robe in $btower.'"); }
	elsif($text=~/tower/i){
		$client->Message(14,"Ranger Band says, 'Aye, Tower of Frozen Shadow, you can find it in Iceclad. Tserrina Syl Tor and her minions live there, and it is infested with undead, vampires, and more.'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 90)){
	  $client->Message(14,"Ranger Band says, 'Ever been to $bdagnors?'"); }
	elsif($text=~/dagnors/i){
	  $client->Message(14,"Ranger Band says, 'Strange place that is, over run by aqua goblins, mean little critters. There's one that carries a $prize.'"); }
	elsif($text=~/prize/i){
	  $client->Message(14,"Ranger Band says, 'His name is Bilge Farfathom. Kill the gobbies in the camp, and you'll find him.'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 100)){
	  $client->Message(14,"Ranger Band says, 'Don't let the $bnight catch you in Lake Rathe!'"); }
	elsif($text=~/night/i){
	  $client->Message(14,"Ranger Band says, 'Aye, night time brings out the undead, I seen that in $kithicor too - even seen werewolves in other places.'"); }
	elsif($text=~/kithicor/i){
	  $client->Message(14,"Ranger Band says, 'Aye, a tame forest during the day; But be wary when night falls.'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 110)){
			 if ($event4==1) {#Pitch Black Event
			  $client->Message(14,"Ranger Band says, '2:00am in $boot is called the witching hour, you better not be there if you're not ready!'");}
			 else {
			  $client->Message(14,"Ranger Band says, 'Beware of the Werewolves at night!'"); }
	}
	elsif($text=~/Ocean of Tears/i){
	  $client->Message(14,"Ranger Band says, 'Aye, night time brings out the undead, People turn into wolves and $skeletons are everywhere!'"); }
	elsif ($text=~/skeletons/i) {
  	  $client->Message(14,"Ranger Band says, 'Aye, Captain Kidd is one of them, and he's the meanest of them all - stay away from the pier when you see the Ghost Ship coming, Captain Kidd is riding it.'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 120)){
		   $client->Message(14,"Ranger Band says, 'The Pirates of $bgunthak bore many treasures.'"); }
	elsif ($text=~/gunthak/i) {
	  $client->Message(14,"Ranger Band says, 'Aye, Gunthak, Dulak, Nadox, Torgiran, a world of $pirates and $treasure.'"); }
	elsif ($text=~/pirates/i) {
  	  $client->Message(14,"Ranger Band says, 'There are many evil pirates there, it's a nasty place to be. You can get there by running though Paineels Warrens, then Stonbrunt. The entrance is at an old Pirate ship by the water.'"); }
	elsif ($text=~/treasure/i) {
  	  $client->Message(14,"Ranger Band says, 'Many riches those pirates carry. You can obtain an impressive collection if you aren't killed first!'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 130)){
		   $client->Message(14,"Ranger Band says, 'Did I tell you how I made $bfriends with the frog people?'"); }
	elsif($text=~/friends/i){
	  $client->Message(14,"Ranger Band says, 'I met a frog at a town in Swamp of no Hope. His name is 'Exterminator Talern' and he collects mosquito wings. The more I gave him, the more he liked me - then one day I was in Sebilis; The frogs there liked me too!'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 140)){
		   $client->Message(14,"Ranger Band says, 'Funny thing I noticed about $bdroga was that when I went there after level 45, 
		   all the monsters had changed and the loots were new!'"); }
	elsif($text=~/droga/i){
	  $client->Message(14,"Ranger Band says, 'Aye, I saw the same think happen in Nurga and Cazic-Thule too.'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 150)){
		   $client->Message(14,"Ranger Band says, 'Have you found the new caves in $btoxxulia yet?'"); }  
	elsif($text=~/toxxulia/i){
	  $client->Message(14,"Ranger Band says, 'They are both near the entrance to Kerra Ridge. One leads to Hollowshade Moore, the other to the Mines of Glooming Deep.'"); }
	elsif(($text=~/traveled/i) && ($random_result3 <= 165)){
		   $client->Message(14,"Ranger Band says, 'Lockjaw wasn't the only monster $bcroc I found while exploring Oasis of Marr.'"); }
	elsif($text=~/croc/i){
	  $client->Message(14,"Ranger Band says, 'While I was exploring Oasis of Marr, I spotted an alligator with an unfamiliar name. That name was Quagmire.'"); } 
	elsif(($text=~/traveled/i) && ($random_result3 <= 180)){
		   $client->Message(14,"Ranger Band says, 'Did I tell you about this lady's terrifying $bdream?'"); }
	elsif($text=~/dream/i){
	  $client->Message(14,"Ranger Band says, 'Aye, she has a terrible fear of snakes - woke up one morning shaking all over! She told me she dreamt of a giant rattlesnake named 'Craven' who roamed the commonlands near Freeport, attacking anyone within reach.'"); }
## Band Saystuff Ends here
	elsif($text=~/buffs/i){
	  $client->Message(14,"Ranger Band says, 'Good hunting!'");
	  $npc->CastSpell(269,$userid); }
	  
##MOONSTONES QUESTS
	if(($text=~/moonstone/i) && ($zoneid == 165)){
	  $client->Message(14,"Ranger Band says, 'I see you made it to $shadeweavers.'"); }
	elsif(($text=~/shadeweavers/i) && ($zoneid == 165)){
	  $client->Message(14,"Ranger Band says, 'I possess a $legendary moonstone that you may be interested in. I also possess another Moonstone that will $transport you out of this moon in an instant.'"); }
	elsif($text=~/legendary/i){
	  $client->Message(14,"Ranger Band says, 'I can grant you this Moonstone, but I need to be sure you have learned the way of the $sword.'"); }
	elsif($text=~/sword/i){
	  $client->Message(14,"Ranger Band says, 'Bring me four pieces of cloth armor of any type as proof of your abilities, and I will grant you the Moonstone.'"); }
	elsif(($text=~/transport/i) && ($zoneid == 165)){
	  $client->Message(14,"Ranger Band says, 'Bring me four pieces of dingy armor of any type, and I will grant you this Moonstone of the $wind.'"); }
	elsif(($text=~/wind/i) && ($zoneid == 165)){
	  $client->Message(14,"Ranger Band says, 'Aye, Moonstone of the Wind! Fastest moonstone in Norrath, also great to have when trying to escape a dire situation.'"); }
	elsif(($ulevel <= 10) && ($text=~/New Years/i) && ($event1==1)){
	  $client->Message(14,"Ranger Band says, 'What will I do in $activeYear you ask? I'll travel around and make new friends. I'll seek adventure so I can tell stories about my travels to anyone who wants to hear. Would you like to travel too? Maybe I can help! I have a stack of Moonstones with me, but you guessed it; bring what I want, and I will give you a random Moonstone in return - go and find me: 1 Beetle leg, 1 Spider leg, 1 cracked staff and 1 Bone Chips.'"); }
	#Orc EVENT 
	elsif(($ulevel <= 20) && ($text=~/interest/i) && ($event5==1) && ($charid > $minCharID)){ #Must have Ladder check here
	  $client->Message(14,"Ranger Band says, 'I have a collection of Moonstones I obtained while camping certain named mobs in Norrath, I haven't much need for them anymore, void to $tempt you with a quest!'"); }
	elsif(($ulevel <= 20) && ($text=~/tempt/i) && ($event5==1) && ($charid > $minCharID)){ #Must have Ladder check here
	  $client->Message(14,"Ranger Band says, 'I have always disliked the orcs, show me you dislike them too - Bring me one orc scalp and one orc skull and I will reward you.'"); }
	elsif(($ulevel <= 65) && ($text=~/Easter/i) && ($event2==1)){
	  $client->Message(14,"Ranger Band says, 'Oh yes, Easter! I'm in a pinch with that: I'm throwing a big Easter party for all my friends but I don't have enough eggs for the easter egg hunt!'");
	  $client->Message(14,"Ranger Band says, 'I need eggs of any type. For every four eggs you bring me, I will give you a handsome reward!'"); }
	elsif(($ulevel <= 65) && ($text=~/Bloodhunt/i) && ($event3==1)){
	  $client->Message(14,"Ranger Band says, 'Countess Zellia can be found around here at night.'"); }
	elsif(($ulevel <= 65) && ($text=~/Christmas/i) && ($event6==1)) {
	  $client->Message(14, "Ranger Band says, 'I've been busy making these colorful bags for presents. I have so many and want to make something $different.'"); }
	elsif(($ulevel <= 65) && ($text=~/different/i) && ($event6==1)){
	  $client->Message(14,"Ranger Band says, 'I am interested in spider silks for creating something different. I'll trade you one of my hand-made colorful bags for four spider silks of any kind.'"); }
	
}#End sub EVENT_SAY

sub convert_utility { #Angelox: for converting to higher coinage 
   do{
      my $amount = 0;
        if ($_[1] == 1) { #copper
          if ($_[0] < 100){
              $amount =10;
            }
          elsif ($_[0] < 1000){
              $amount =100;
            }
          elsif ($_[0] < 1000000){
              $amount =1000;
            }
        } elsif ($_[1] == 2) { #silver
           if ($_[0] < 100){
               $amount =10;
           }
           elsif ($_[0] < 1000000){
              $amount =100;
           }
        } elsif ($_[1] == 3) { #gold
           if ($_[0]< 1000000){
              $amount =10;
           }
        }

      my @array =();
        for (my $i=0; $i<1000001;$i+=$amount){
            push  ( @array,$i);
            }
      my $itr=0;
      foreach my $number (@array){
        $itr++ and next if  $_[0] >= $number;
      }
      #my $nearest = $array[$itr-1];
      $change =  $_[0] -$array[$itr-1];
      #$client->Message (14,"your closest $nearest");
     # $client->Message (14,"your change $change");

          $myplatinum = (($copper/1000) + ($silver/100) + ($gold/10) + $platinum);
          $mygold = (($copper/100) + ($silver/10) + $gold + (10*$platinum));
          $mysilver = (($copper/10) + $silver + (10*$gold) + (100*$platinum));
          $mycopper = ($copper + (10*$silver) + (100*$gold) + (1000*$platinum));
          if ((($mycopper >= 10) && ($mycopper < 100)) || (($mysilver >= 1) && ($mysilver < 10))){
              $client->Message (14,"Here's $mysilver silver...");
              quest::givecash(0,$mysilver,0,0);
          }
          elsif ((($mycopper >= 100) &&($mycopper < 1000)) || (($mysilver >= 10)&& ($mysilver < 100)) || (($mygold >= 1) && ($mygold < 10))){
              $client->Message(14,"Here's $mygold gold...");
              quest::givecash(0,0,$mygold,0);
          }
          elsif (($mycopper >= 1000) || ($mysilver >= 100) || ($mygold >= 10) || ($myplatinum >= 1)){
              $client->Message(14,"Here's $myplatinum platinum...");
              quest::givecash(0,0,0,$myplatinum);
            }
           $_[0] = $change;
            if ($_[0] < 10){
                  if ($_[1] == 1) {
                     quest::givecash($_[0],0,0,0);
                  } elsif ($_[1] == 2) {
                     quest::givecash(0,$_[0],0,0);
                  } elsif ($_[1] == 3) {
                     quest::givecash(0,0,$_[0],0);
                  }
		  $client->Message (14,"Here's the excess...");
                  plugin::return_items(\%itemcount);
                  $MoneyFlag =  0;
            }
      }while ($_[0] >10);
} #End sub CONVERT_UTILITY

sub EVENT_ITEM {
my @itemz = (1000 .. 1036,1468 .. 1479,30670 .. 30680,94000,94001,10152,42984);
my $total = 0;
foreach my $xitem (@itemz) {
$total += $itemcount{$xitem};
};
if (($total >= 4) && ($zoneid == 165)) {
 $client->Message(14,"Ranger Band says,\"Thank you $name! Here is your Moonstone of the Wind.\"");
 $client->Message(6,"You received the Moonstone of the Wind!");
 quest::ding();
 quest::summonitem(139);
 return;
 };
if ($total >= 4) {
 $client->Message(14,"Ranger Band says,\"Thank you $name! Here is your Moonstone to Shadeweaver's Thicket.\"");
 $client->Message(6,"You received the Moonstone of the Shadeweaver!");
 quest::ding();
 quest::summonitem(138);
 return;
 };

if ($event2==1){
  my @itemy = (1429,3457,3458,5495,10160,12765,12787,13088,13164,14386,14909,14910,19137 .. 19139,28322,29746,31862,32643 .. 32645,36154,36160,36205,36454,36595,45376,46485,48082,49022,51012,54657,55599,55900,65489,66182,81909,82028,82427,83544,98184 .. 98201,105918,106418); ## Easter Event eggs
  my $total2 = 0;
  foreach my $xxitem (@itemy) {
  $total2 += $itemcount{$xxitem};
  };
  my @itemt = (50005 .. 50246); ## Easter Event random item reward
  my $total3 = $itemt[ rand @itemt ];
   if ($total2 >= 4) {
    $client->Message(14,"Ranger Band says,\"Thank you $name! Enjoy your reward.\"");
	quest::ding();
    quest::summonitem($total3);
  return;
  };
};

 if ($event1==1){
   if (($ulevel <= 10) && ((plugin::check_handin(\%itemcount, 13417 =>1, 13250 =>1, 6018 =>1, 13073 =>1))|
			   (plugin::check_handin(\%itemcount, 13254 =>1, 13250 =>1, 6018 =>1, 13073 =>1)))) { #newyear turnin for moonstones
    my @items = (125 .. 139,141,142); ## New Years Event random item reward
    my $total4 = $items[ rand @items ];
    $client->Message(14,"Ranger Band says,\"Congratulations, $name! Take this Moonstone as a reward!.\"");
    $client->Message(6,"You received a random Moonstone! In the event that you already got the Moonstone Ranger Band was about to give you, you will get nothing. Better luck next time!\"");
    quest::summonitem($total4);
    quest::exp(1000);
    quest::ding();
    return;
   }
 }

 if ($event5==1){ # Must have Ladder Check below
   if (($ulevel <= 20) && ($charid > $minCharID) && (plugin::check_handin(\%itemcount, 13791 =>1, 16174 =>1))) { #Turnin for random Moonstones
    my @items = (125 .. 139,141,142); ## Random  Moonstone item reward
    my $total4 = $items[ rand @items ];
    $client->Message(14,"Ranger Band says,\"Well done, $name! Take this Moonstone as a reward!.\"");
    $client->Message(6,"You received a random Moonstone! In the event that you already got the Moonstone Ranger Band was about to give you, you will get nothing. Better luck next time!\"");
    quest::summonitem($total4);
    quest::exp(1000);
    quest::ding();
    return;
   }
 }

 if ($event6==1){
  my @itemsk = (9914,13041,13099,20357,54234,86010,2659,2789,2790,6695,10983,12766,12878,12957,16483,16484,25306); ## Spider Silks for Colorful Bag Event.
  my $total6 = 0;
  foreach my $skitem (@itemsk) {
  $total6 += $itemcount{$skitem};
  };
  my @itemsl = (32001 .. 32009); ## Colorful Bag Event random item reward.
  my $total7 = $itemsl[ rand @itemsl ];
   if ($total6 >= 4) {
    $client->Message(14,"Ranger Band says,\"Thank you $name! Have a nice Christmas day.\"");
    quest::ding();
	quest::summonitem($total7);
  return;
  };
 }

my $owner = $npc->GetOwnerID();
if ($owner > 0) {
}
#Angelox: start money exchange (uses convert_utility)
my $MoneyFlag =  0;
if (($copper > 0 )|| ($silver > 0 )|| ($gold > 0 )|| ($platinum > 0)){
$MoneyFlag = 1;
}
if  ($platinum > 0){
      $client->Message(14,"Platinum doesn't need converting.");
	  if (($itemcount{ $item1} == 1) || ($itemcount{ $item2} == 1)||
	      ($itemcount{ $item3} == 1) || ($itemcount{ $item4} == 1) ){
	      $client->Message(14,"Don't hand me items mixed with coinage.");  
	  }
      quest::givecash($copper, $silver, $gold, $platinum);
      plugin::return_items(\%itemcount);
      $MoneyFlag =  0;
      return;
}
if (( ($copper > 0 )&& ($silver > 0 )&& ($gold > 0 ))||
    (($copper > 0 )&& ($silver > 0 ))|| ( ($copper > 0 )&&  ($gold > 0 ))
    ||( ($copper > 0 )&& ($gold > 0 ))|| ( ($silver > 0 )&&  ($gold > 0 ))){
      $client->Message(14,"Hand me me  copper , silver  or gold individually.");   
	  if (($itemcount{ $item1} == 1) || ($itemcount{ $item2} == 1)||
	      ($itemcount{ $item3} == 1) || ($itemcount{ $item4} == 1) ){
	      $client->Message(14,"Don't hand me items mixed with coinage.");  
	  }
    quest::givecash($copper, $silver, $gold, $platinum);
    plugin::return_items(\%itemcount);
    $MoneyFlag =  0;
      return;
  }
   if (($copper >=1 ) && ($copper <= 1000000)) {
      convert_utility($copper, 1);
  } 
  elsif (($silver >= 1) && ($silver <= 1000000)) {
      convert_utility($silver, 2);
  } 
  elsif ($gold >= 1 && $gold <= 1000000) {
      convert_utility($gold, 3);
  } 
  elsif ($MoneyFlag ==1){
  $client->Message(14,"Ranger Band says,\"You gave me too much.\" ");
	  if (($itemcount{ $item1} == 1) || ($itemcount{ $item2} == 1)||
	      ($itemcount{ $item3} == 1) || ($itemcount{ $item4} == 1) ){
	      $client->Message(14,"Don't hand me items mixed with coinage.");  
	  }
   quest::givecash($copper, $silver, $gold, $platinum);
   plugin::return_items(\%itemcount);
  $MoneyFlag = 1;
  } elsif ($MoneyFlag ==0){ 
	$client->Message(14,"Ranger Band says,\"I have no use for this.\" ");
	plugin::return_items(\%itemcount);
  }
}#End sub EVENT_ITEM

sub EVENT_COMBAT{
my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)) {
	quest::say("The time has come for you to die!"); }
	elsif(($combat_state == 1) &&($random_result<=40)) {
    quest::say("It is unwise of you to try that!"); }
	elsif(($combat_state == 1) &&($random_result<=60)) {
    quest::say("How dare you attack me!"); }
	elsif(($combat_state == 1) &&($random_result<=80)) {
    quest::say("The spirits will condem you!"); }
	elsif($combat_state == 1) {
    quest::say("I shall bathe in your blood!"); }
}
sub EVENT_DEATH{
quest::emote("'s corpse drops to the ground.");
 }