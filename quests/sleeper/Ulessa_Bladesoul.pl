##Ulessa Bladesoul ID 128022 ##
sub EVENT_SAY {
  my $unhappy = quest::saylink("unhappy", 1);
  my $incident = quest::saylink("incident", 1);
  my $things = quest::saylink("things", 1);
  my $mess = quest::saylink("mess", 1);
  my $open = quest::saylink("open", 1);
  my $happened = quest::saylink("happened", 1);
  my $beasts = quest::saylink("beasts", 1);
  my $evil = quest::saylink("evil", 1);  
  my $shadow = quest::saylink("shadow", 1); 
  my $waiting = quest::saylink("waiting", 1);  
  my $idea = quest::saylink("idea", 1);  
  my $help = quest::saylink("help", 1);  
   if($text=~/hail/i){
     quest::emote(' looks up with you and sniffles.');
     quest::ze(14, "From the look of it, she has been sniffling like that for quite some time, though you're not sure how long.");
	 quest::say("Oh, I'm sorry. I really don't mean to do this in front of you, it's just that I'm so very $unhappy.");
     }
	elsif($text=~/unhappy/i){
     quest::say("I'm unhappy because I haven't seen my husband in so long. We were so very in love, did everything together. But after the $incident, I never saw him again. It's like a pang in the back of my throat keeps causing me pain, but it's not a pain that is tangible or real, simply an emotional one. I feel so empty though without Paldar by my side.");
     }	 
    elsif($text=~/incident/i){
     quest::say("It all started because of a friend we once had. I say once had because he, like myself, is dead and gone. Milas was his name and he was an adventuresome little fellow, always looking to go out and do the most dangerous, most fanatically unheard of $things to live his life. His final endeavor was to come to this wretched place and find some lost sleeping dragon. Paldar and I tried to talk him out of it, but he wouldn't listen. We tried to tell him that he was just looking to get himself killed and that he should just let it go. But gnomes will be gnomes and he was a gnome. So just like a gnome, he was stubborn and wouldn't listen to a thing we had to say.");
	 }
    elsif($text=~/things/i){
     quest::say("He went off on his own after we pleaded with him not to go and came here, to this. . . this. . . PLACE! Ugh, it makes me so angry to think that he came here, and like the fools that we were, Paldar and I came after him to try and stop him. Did we stop to think that maybe we should just let him go? No, of course not, because that's not what friends do for their friends. Instead, we followed him and we got ourselves caught up in the $mess.");
	 }
    elsif($text=~/mess/i){
     quest::say("What mess? I'll tell you what mess! We came here, of course terrified out of our minds. We saw the pretty sights, found out that there are huge golems and what not all over the place just waiting to grind you into velium dust, and then we came to a door. So tell me, what do you have to do when you come to a door?Of course you try to $open it.");
	 }
	elsif($text=~/open/i){
     quest::say("Exactly! And that's just what we did, because we thought that perhaps Milas was behind the door. We didn't take into account that the door was twenty times larger than either of us, but we still opened it. Well, beyond that door we didn't find the gnome we had come here to find. Instead we found the creator golem, set in that room to create more golems for the ones that failed. I'm sure you can imagine what $happened after that.");
	 }
    elsif($text=~/happened/i){
     quest::say("We tried to close the door, hoping he wouldn't see us, but he did. He came charging after us, his feet making thunderous footsteps the entire way. My dear brave husband stood up to him and his newly built sentries to try and let me escape, and escape I did. That is, if you can really even call it an escape. I made it out of the eye of that creator beast and fumbled my through this forsaken tomb, barely missing the various $beasts of burden along the way.");
	 }
    elsif($text=~/beasts/i){
     quest::say("Golems, gargoyles, wyverns, spectres, you name it. Each time I saw one, I almost let out a scream that would have awoken the dead, if they hadn't been already I mean. I got turned around quite a few times too, going back and forth not remembering which way was up. But finally, I got to this statue behind me and looked at it. It was so still and gentle, yet it portrayed the epitome of $evil that had slain my husband and most likely slain our friend Milas.");
	 }
    elsif($text=~/evil/i){
     quest::say("The evil of the sleeping prismatic dragon; the evil that corrupted our little gnomish friend and brought us to our deaths. It was here that I stood, looking at this statue that I realized that it was hopeless for me to continue on. What was I trying to prove to myself anyway? That I could live on and survive? That I could find this infamous sleeper and tell him to shove off? None of that was going to be part of my story, none of it at all. Instead, while I was gawking at the marble dragon, a $shadow engulfed me.");
	 }
    elsif($text=~/shadow/i){
     quest::say("That's the very same thought that was going through my head at the time. Whose shadow could that be, or rather. . . what shadow could possibly be that large? When I turned, I had my answer. There, in front of me stood a lumbering golem, its bright velium skin glistening in front of me. It was at that point that I knew my life had been for naught, and that I would never see my husband again. So here I stand, an ever-lasting spirit of the tomb, $waiting eternally to see my poor Paldar in the after life.");
	 }
    elsif($text=~/waiting/i){
     quest::say("Waiting? Who knows why I'm waiting. I guess I felt that someday, some live being like yourself could help me find my beloved. Perhaps allow us to reunite, if only for a moment. I had some kooky $idea about how to make that work, but I really didn't have a way to get the components I needed to make them work.");
	 }
    elsif($text=~/idea/i){
     quest::say("All right, but you're probably going to think this sounds silly. I've had quite some time to think about this, as you can probably tell, and when I'm not crying my eyes out I actually do think pretty well. I had envisioned that if I could combine the right set of components together in the right quantities, I might be able to devise a potion that would grant me corporeal ability, at least for a short duration. My knowledge of things like this aren't as developed as Paldar's ever were though, so I really don't know what the best things to use would be. Who am I kidding? This was entirely off the wall, and there's no way anyone would want to $help me.");
	 }
    elsif($text=~/help/i){
     quest::say("You will? Well like I said, I don't know exactly what is required but I'm sure that if you find something out of the ordinary, especially that bring essence to any of the beings here, it would proably be useful. Here, take this bag and put anything you find in there. It's not a real sturdy bag, so if you do find something bring it back to me as quickly as you can. I really appreciate what you're doing for me, and if it helps me find Paldar. I'll be eternally grateful!");
	 quest::summonitem(17147);
	 }
	 }
sub EVENT_ITEM {
  ##Needed items to combine in Spiritual Prismatic Pack (17147)##
  ##Digest of Devastating Frills (18473) Drops from Milas_An`Rev (Wyveryn form)##
  ##Wings of Oversight (29467) Drops from The Overseer##
  ##Furious Shroud of Unlife (29468) Drops from Furious Phantasm##
  ##Globe of Frozen Vigor (29469) Drops from Sinister Gargoyle##
  ##Globe of Frozen Vitality (29470) Drops from Sinister Gargoyle##
  ##Serrated Gargoyle Claw (29471) Drops from Sinister Gargoyle or Forbidding Gargoyle##
  ##Stinted Velium Drapes (29475) Drops from Master of the Guard##
  ##Founder's Velium Creation (29479) Drops from The Progenitor##
  ##Sightless Velium Eye (29482) Dropd from The Final Arbiter##
  ##Drakeen Scales (29483) Drops from Drakeen Controller## 
   if ($itemcount{20410} == 1) { 
    quest::spawn2(128025,0,0,1295,-1392,-124.1,128);
	quest::depop();
   }
   }
            