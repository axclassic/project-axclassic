#Orcs, Bats and Rats Oh My! 
#freporte
#Aardil

sub EVENT_SAY {
    my $Tails = quest::saylink("Tails", 1);
    my $Wings = quest::saylink("Wings", 1);
    my $Scalps = quest::saylink("Scalps", 1);
    if($text=~/Hail/i) {
        quest::say("Bats Rats and Orcs Oh My! Thurzin Kaver, the leader of the Necromancer Guild here in Freeport is raging war against the pests aound the city gates. Why a necromancer cares about such things, The Master said doing this would win favor with the Necromancer guild and this is the task he assigned to me.");
        quest::say("I am to wait and recruit others into doing his bidding. I need your help $name, Kill all the orcs, bats and rats you run across and collect any Plague Rat $Tails, Bat $Wings or Deathfisp Pawn $Scalps.");
        quest::say("return them to me and I shall record your deeds in the journal that the master gave me and pass the rewards on to you.");   
    }
    if($text=~/Tails/i) {
        quest::say("Bring back four Plague Rat Tails as proof of your work and I shall reward you.");
    }
    if($text=~/wings/i) {
        quest::say("Bring back four Bat Wings as proof of your work and I shall reward you.");
    }
    if($text=~/scalps/i) {
        quest::say("Bring back four Deathfist Pawn Scalps as proof of your work and I shall reward you.");
    }
}
sub EVENT_ITEM{
    if($itemcount{13794} => 4) {
        quest::exp(25);
        quest::ding();
        quest::say("Thank you your name and kills have been recorded.");
        quest::say("We still have much work to do!");
        quest::faction(235,15);
        quest::givecash(5,2,1,0);
    }
    elsif($itemcount{13068} => 4) {
        quest::exp(25);
        quest::ding();
        quest::say("Thank you your name and kills have been recorded.");
        quest::say("We still have much work to do!");
        quest::faction(235,15);
        quest::givecash(5,2,1,0);
    }
    elsif($itemcount{9131} => 4) {
        quest::exp(25);
        quest::ding();
        quest::say("Thank you your name and kills have been recorded.");
        quest::say("We still have much work to do!");
        quest::faction(235,15);
        quest::givecash(5,2,1,0);
    }
}