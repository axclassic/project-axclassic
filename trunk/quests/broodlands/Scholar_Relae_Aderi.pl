sub EVENT_SAY {
my $help = quest::saylink("help", 1);
   if ($text=~/Hail/i) {
   quest::emote(' nods his head in acknowledgement and smiles.');
   quest::say("Welcome to the Norrath's Keepers' enclave. We are busy protecting the way of the right and honorable now. Our world is at a crossroads and we must endeavor to ensure we maintain order as much as we can. Should you wish to $help us, do say so."); 
   }
   if ($text=~/help/i) {
   quest::say("Those are encouraging words and we will gladly take your offer. Please see Nylaen Kel`Ther, my trusted friend. While his tasks may not seem glorious, they are necessary for us to gain a foothold against the Dark Reign, the followers of Lanys T`Vyl, the Child of Hate. They have their grim eyes set on seeing the end of us all. To begin, from the volcano, we need ingredients to create an antidote, help collecting Delvian teeth for our arrowheads, and handling goblin greed in the Stillmoon Temple. When you satisfy these needs, then we shall speak again.");
   }
   if ($ulevel == 41 && $text=~/Najena/i ){
     if ($faction >=5){
   quest::say("You say a necromancer had a hand in this? Hmmm, I expected dark magic was afoot. I must report this to Firiona and allow her to meditate upon the situation. In the meantime, you should get some rest. Norrath's Keepers may require your assistance soon.");
   quest::ding();
   quest::faction(2788,120);
   quest::exp(639370);
   quest::givecash(0,0,0,40);
   }
   if ($ulevel == 42 && $text=~/Najena/i ){
     if ($faction >=5){
   quest::say("You say a necromancer had a hand in this? Hmmm, I expected dark magic was afoot. I must report this to Firiona and allow her to meditate upon the situation. In the meantime, you should get some rest. Norrath's Keepers may require your assistance soon.");
   quest::ding();
   quest::faction(2788,120);
   quest::exp(671710);
   quest::givecash(0,0,0,40);
   }
   if ($ulevel == 43 && $text=~/Najena/i ){
     if ($faction >=5){
   quest::say("You say a necromancer had a hand in this? Hmmm, I expected dark magic was afoot. I must report this to Firiona and allow her to meditate upon the situation. In the meantime, you should get some rest. Norrath's Keepers may require your assistance soon.");
   quest::ding();
   quest::faction(2788,120);
   quest::exp(704470);
   quest::givecash(0,0,0,40);
   }
   if ($ulevel == 44 && $text=~/Najena/i ){
     if ($faction >=5){
   quest::say("You say a necromancer had a hand in this? Hmmm, I expected dark magic was afoot. I must report this to Firiona and allow her to meditate upon the situation. In the meantime, you should get some rest. Norrath's Keepers may require your assistance soon.");
   quest::ding();
   quest::faction(2788,120);
   quest::exp(738010);
   quest::givecash(0,0,0,40);
   }
   if ($ulevel == 45 && $text=~/Najena/i ){
     if ($faction >=5){
   quest::say("You say a necromancer had a hand in this? Hmmm, I expected dark magic was afoot. I must report this to Firiona and allow her to meditate upon the situation. In the meantime, you should get some rest. Norrath's Keepers may require your assistance soon.");
   quest::ding();
   quest::faction(2788,120);
   quest::exp(1629580);
   quest::givecash(0,0,0,40);
   }
   if ($ulevel == 46 && $text=~/Najena/i ){
     if ($faction >=5){
   quest::say("You say a necromancer had a hand in this? Hmmm, I expected dark magic was afoot. I must report this to Firiona and allow her to meditate upon the situation. In the meantime, you should get some rest. Norrath's Keepers may require your assistance soon.");
   quest::ding();
   quest::faction(2788,120);
   quest::exp(869540);
   quest::givecash(0,0,0,40);
   }
   if ($ulevel == 47 && $text=~/Najena/i ){
     if ($faction >=5){
   quest::say("You say a necromancer had a hand in this? Hmmm, I expected dark magic was afoot. I must report this to Firiona and allow her to meditate upon the situation. In the meantime, you should get some rest. Norrath's Keepers may require your assistance soon.");
   quest::ding();
   quest::faction(2788,120);
   quest::exp(908180);
   quest::givecash(0,0,0,40);
   }
   if ($ulevel == 48 && $text=~/Najena/i ){
     if ($faction >=5){
   quest::say("You say a necromancer had a hand in this? Hmmm, I expected dark magic was afoot. I must report this to Firiona and allow her to meditate upon the situation. In the meantime, you should get some rest. Norrath's Keepers may require your assistance soon.");
   quest::ding();
   quest::faction(2788,120);
   quest::exp(947660);
   quest::givecash(0,0,0,40);
   }
   if ($ulevel == 49 && $text=~/Najena/i ){
     if ($faction >=5){
   quest::say("You say a necromancer had a hand in this? Hmmm, I expected dark magic was afoot. I must report this to Firiona and allow her to meditate upon the situation. In the meantime, you should get some rest. Norrath's Keepers may require your assistance soon.");
   quest::ding();
   quest::faction(2788,120);
   quest::exp(987980);
   quest::givecash(0,0,0,40);
   }
   if ($ulevel == 50 && $text=~/Najena/i ){
     if ($faction >=5){
   quest::say("You say a necromancer had a hand in this? Hmmm, I expected dark magic was afoot. I must report this to Firiona and allow her to meditate upon the situation. In the meantime, you should get some rest. Norrath's Keepers may require your assistance soon.");
   quest::ding();
   quest::faction(2788,120);
   quest::exp(1029140);
   quest::givecash(0,0,0,40);
   }
   else{
   quest::say("I heard you the first time. We will check into this now go find something useful to do $name");
   }
   }
   }
   }
   }
   }
   }
   }
   }
   }
   }
   }
   
sub EVENT_ITEM {
   if ($ulevel == 31 && plugin::check_handin(\%itemcount, 37848 => 1)) {
   quest::say("It is time to repay you for all you have done.");
   quest::ding();
   quest::exp(307010);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 32 && plugin::check_handin(\%itemcount, 37848 => 1)) {
   quest::say("It is time to repay you for all you have done.");
   quest::ding();
   quest::exp(327470);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 33 && plugin::check_handin(\%itemcount, 37848 => 1)) {
   quest::say("It is time to repay you for all you have done.");
   quest::ding();
   quest::exp(348590);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 34 && plugin::check_handin(\%itemcount, 37848 => 1)) {
   quest::say("It is time to repay you for all you have done.");
   quest::ding();
   quest::exp(370370);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 35 && plugin::check_handin(\%itemcount, 37848 => 1)) {
   quest::say("It is time to repay you for all you have done.");
   quest::ding();
   quest::exp(479640);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 36 && plugin::check_handin(\%itemcount, 37848 => 1)) {
   quest::say("It is time to repay you for all you have done.");
   quest::ding();
   quest::exp(453720);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 37 && plugin::check_handin(\%itemcount, 37848 => 1)) {
   quest::say("It is time to repay you for all you have done.");
   quest::ding();
   quest::exp(479640);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 38 && plugin::check_handin(\%itemcount, 37848 => 1)) {
   quest::say("It is time to repay you for all you have done.");
   quest::ding();
   quest::exp(506280);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 39 && plugin::check_handin(\%itemcount, 37848 => 1)) {
   quest::say("It is time to repay you for all you have done.");
   quest::ding();
   quest::exp(533640);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 40 && plugin::check_handin(\%itemcount, 37848 => 1)) {
   quest::say("It is time to repay you for all you have done.");
   quest::ding();
   quest::exp(1201720);
   quest::givecash(0,0,0,40);
   }
       else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }