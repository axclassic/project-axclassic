##Milas An'Rev 128040.pl##
sub EVENT_SAY {
  my $why = quest::saylink("why", 1);
  my $information = quest::saylink("information", 1);
  my $trek = quest::saylink("trek", 1);
  my $saw = quest::saylink("saw", 1);
  my $undescribable = quest::saylink("undescribable", 1);
  my $friends = quest::saylink("friends", 1);
  my $trouble = quest::saylink("trouble", 1);
  my $ancients = quest::saylink("ancients", 1);
     if($text=~/hail/i){
    quest::say("Well, well, well. Look what the wyvern dragged in. I dun get visitors all that often, but usually when I do, it's a bad omen. Ye know, Ye look a lot like some of the buggers that cane 'round here not too long ago.");
	quest::say("Well, heh, not that long ago for me could have been years and years ago. But, by the looks of ye, ye wouldn't know $why that is.");
    }
	if($text=~/why/i){
    quest::say("If'n ye looked around ye at all, ye'd see that there was a bunch of wyverns 'round here. Now how is it that a little gnome like meself could survive in this place with all of them runnin' round?");
    quest::say("Exactly, I couldn't and didn't. I came here a long time ago, searchin' for treasures and $information the likes of whichI never thought possible. I tried to get a couple of my old $friends along too, but they thought it was goin' to be too dangerous. I guess they were right, and I shouldn't have ever come here, but I did.");
	}
   if($text=~/information/i){
     quest::say("Well, long time ago there was this story 'bout a sleeping critter who was a mean ol' guy that no one really liked all that much. Some of his brothers an' sisters decided that they were goin' to put him to bed for being so mean, and so they locked him up deep down inside this tomb. They chose four of the most strongest an' had them keep him under wraps so he wouldn't get loose an' go on a killind spree. Anyway, I caught wind of this and decided that this was the greatest achievement a gnome like meself could ever make, and I began a $trek for it.");
    }
	if($text=~/trek/i){
	  quest::say("It took me years to find this tomb, searchin' all over Norrarth for hints as to where it might be. No one I talked to had any idea of its whereabouts though. I kept searchin' though, and the one day I found this shrine sitting out in the middle of the frostbitten ice caps. It looked like a sleepin' dragon, so I figured it had to be related. I walked up to it, and what did my eyes spy, but an inscription telling the way to this very tomb! I knew that I would have to keep going, despite my tired legs, my hungry belly, and my aching body. When I finally found the entrance to the tomb, I couldn't believe what I $saw.");
    }
    if($text=~/saw/i){
      quest::say("It was truly $undescribable.");
    }
	if($text=~/undescribable/i){
      quest::say("Are ye daft? I said it were truly undescribableI wish my $friends were here.");
    }
	if($text=~/friends/i){
      quest::say("Paldar and Ulessa Bladesoul. A couple of the most enjoyable people I've every known. They tried to convince me that coming here so long ago was a bad idea, but being the foolish explorer that I was, I made my way here anyway. They tried to tell me that there were bad things brewin' down here, and that any attempt to find orsomehow wake the dragon up was a bad idea. It turned out they were right. Not only that, but not too long ago, some more daring explorers came here and woke him up. When they did that, there was a whole lot of $trouble for everyone.");
    }
	if($text=~/trouble/i){
      quest::say("The kind of trouble that happens when someone does somethin' they shouldn't. They woke Kerafyrm up and they paid for it, believe me. This place has changed too, seemingly because there are these new Ancient dragons who control it. They're awaiting the return of Kerafyrm from whereever he is, and they dont want anyone to disturb them. So it comes to bear, are you here to find the $ancients?");
	  }
	if($text=~/ancients/i){
	quest::spawn2(128168,0,0,1104,-1743,101,0);
	quest::depop();
	}
   }
