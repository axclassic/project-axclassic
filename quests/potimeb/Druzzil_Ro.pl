# Druzzil_Ro.pl npcid - 223212 THE END!!

sub EVENT_SPAWN {
    quest::emote("speaks with no movement of her mouth. Her thoughts flow through you, calming you as you begin to comprehend what she is trying to communicate to you.");
    #5
    quest::settimer("druzzil1",5);
}

sub EVENT_TIMER {
    if($timer eq "druzzil1") {
        quest::emote("speaks to your mind, 'Zebuxoruk, my student I cannot allow this to happen. If you were to escape from another prison the will and power of the gods will have been compromised.'");
         #5
        quest::settimer("druzzil2",12);
        quest::stoptimer("druzzil1");
    }

    if($timer eq "druzzil2") {
        quest::emote("speaks to your mind, 'That I did, but I also taught you not to share your wealth of knowledge if it would affect the fate of others. I cannot allow this to happen. I must set things back to how they were before you and these mortals arrived here, I believe that you cannot understand this and I am sorry.'");
        quest::settimer("druzzil3",15);
        quest::stoptimer("druzzil2");
    }

    if($timer eq "druzzil3") {
        quest::emote("looks upon Zebuxoruk one last time, as a wave of sadness comes across her gentle face.");
        quest::settimer("druzzil4",15);
        quest::stoptimer("druzzil3");
    }

    if($timer eq "druzzil4") {
        quest::emote("begins to chant an incantation; mana flows out from her body in all directions. Things begin moving slowly in reverse. You become dizzy from the experience and fall to your knees. As you look up the last thing you can see is Druzzil Ro smiling in your direction. She then waves her arms gracefully and points at you. There is a brilliant flash and you find yourself displaced through time and space. For a moment you lose touch with yourself. As you wake, you find yourself back in the Plane of Knowledge, moments after talking to Maelin with the information of retrieving the Quintessence of Elements. Druzzil has preserved the timeline, an restored existence back to its normalcy.");
        quest::settimer("druzzil5",10);
        quest::stoptimer("druzzil4");
    }

    if($timer eq "druzzil5") {
        quest::stoptimer($timer);
        quest::stoptimer("druzzil5");
        quest::delglobal("blockout");
        quest::delglobal("blockout2");
        quest::delglobal("portal3");
        quest::delglobal("portal4");
        quest::delglobal("portal5");
        my @carray = $entity_list->GetClientList();
        if(@carray) {
            foreach $ent(@carray) {
                my $members = $ent->GetName();
                #back to Pok for clients
                $ent->MovePC(202,1001,8,390,66);
            }
        }
    }
}
#END sub_EVENT_TIMER

