sub EVENT_SAY {
my $help = quest::saylink("help", 1);
   if ($text=~/Hail/i) {
   quest::emote(' nods his head in acknowledgement and smiles.');
   quest::say("Welcome to the Norrath's Keepers' enclave. We are busy protecting the way of the right and honorable now. Our world is at a crossroads and we must endeavor to ensure we maintain order as much as we can. Should you wish to $help us, do say so."); 
   }
   if ($ulevel <= 30 && $text=~/help/i){
   quest::say("I am sorry but I have nothing you could possibly do. Check with the others in the camp as they may have work that someone of your experiance might be able to help the Norrath Keepers with.");
   }
   if ($text=~/help/i) {
   quest::say("Those are encouraging words and we will gladly take your offer. Please see Nylaen Kel`Ther, my trusted friend. While his tasks may not seem glorious, they are necessary for us to gain a foothold against the Dark Reign, the followers of Lanys T`Vyl, the Child of Hate. They have their grim eyes set on seeing the end of us all. To begin, from the volcano, we need ingredients to create an antidote, help collecting Delvian teeth for our arrowheads, and handling goblin greed in the Stillmoon Temple. When you satisfy these needs, then we shall speak again.");
   }
   if ($text=~/Najena/i && $faction <= 5 && $ulevel <= 40 && $ulevel >= 31){
   quest::say("You say a necromancer had a hand in this? Hmmm, I expected dark magic was afoot. I must report this to Firiona and allow her to meditate upon the situation. In the meantime, you should get some rest. Norrath's Keepers may require your assistance soon.");
   quest::ding();
   quest::faction(2788,120);
   quest::exp(10000000);
   quest::givecash(0,0,0,40);
   }
   if ($text=~/Najena/i && $faction >= 5 && $ulevel <= 40 && $ulevel >= 31){
   quest::say("I heard you the first time. We will check into this now go find something useful to do $name");
   }
   if ($ulevel >= 41 && $text=~/help/i){
   quest::say("I am sorry but I have nothing you could possibly do. Check with the others in the camp as they may have work that someone of your experiance might be able to help the Norrath Keepers with.");
   }
 }
sub EVENT_ITEM {
   if ($ulevel <= 40 && $ulevel >= 31 && plugin::check_handin(\%itemcount, 37848 => 1)) {
   quest::say("It is time to repay you for all you have done.");
   quest::ding();
   quest::exp(10000000);
   quest::givecash(0,0,0,40);
   }
       else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }