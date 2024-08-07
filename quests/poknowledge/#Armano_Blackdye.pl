########################################
## NPC:  Armano Blackdye              ##
## Zone: Plane of Knowledge           ##
## Bots  Armourdye unlock skill Quest ##
## Created by Caved for AX-CLASSIC    ##
##       03-03-2013                   ##
########################################
sub EVENT_SAY {
    my $talk = quest::saylink("talk", 1);
    my $command = quest::saylink("command", 1);

    if($text=~/Hail/i) {
        quest::say("Hey hello $name, how are you? My name sounds familiar to you? But of course my brother is the famous painter Dino Blackdye. That is not what I wanted to $talk to you about though.");
    }
    if($text=~/talk/i) {
        quest::say("I could give you the skill to dye your mercenaries armour with a #bot $command . All you have to do is visit my brother Dino and let him fill this vial. The last time I have seen him he was located in the Southern plains of the Karranas close to the Lake Rathe zone. If you hurry I'll tell you some news I just heard. Hurry now...");
        quest::summonitem(10062); #Empty vial
    }
    if($text=~/command/i) {
        quest::say("The command is #bot armorcolor [slot] [red] [green] [blue], if you forget you can always do #bot armorcolor help.");
    }
}

sub EVENT_ITEM{
    if(plugin::check_handin(\%itemcount, 119513 => 1)) {
        quest::say("Wonderfull, I see you have spoken to my brother. How is he doing? Well as promissed here is your #bot armorcolor skill, Myz Rexxal has been grumpy since his sister issue. If you see him stop by and say hello might make him feel better.");
        quest::ding();
        quest::exp(1000);
        quest::setglobal("armorcolor",1,5,"F");
        $armorcolor = undef;
        $client->Message(6,"You have learned the armorcolor skill!");
    }
    else {
        my $stuff = (\%itemcount);
        my $yes = 2;
        foreach my $k (keys(%{$stuff})) {
            next if($k == 0);
            $yes = 1;
        }
        if($yes == 1) {
            quest::say("I don't need this $name. Take it back.");
            plugin::return_items(\%itemcount);
        }
        if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::say("Thanks for the coin!");
        }
    }
}

