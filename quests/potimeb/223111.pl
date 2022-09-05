# _ (223111)

sub EVENT_SIGNAL {
	if($signal == 1000) {
		quest::ze(15,"In the distance, an hourglass appears, the grains of sand falling methodically into place. As quickly as the image was formed, it dissipates.");
	}

    if($signal == 1001) {
		quest::ze(15,"Ethereal mists gather at the far wall, causing it to fade in and out of focus.");
        quest::signalwith(223111, 1010, 2000);
    }
    if($signal == 1010) {
        quest::ze(15,"Solusek Ro says, 'This is absurd, why are we wasting our time and energy on this?! Direct action is needed, now! Banishing Zebuxoruk will not stop the mortals from entering our planes. Their greed for power will have them soon trampling through our realms!'");
        quest::signalwith(223111, 1011, 2000);
    }
    if($signal == 1011) {
        quest::ze(15,"Rallos Zek says, 'On this I agree! We must take action and the time is now. I will not have these mortals achieving the powers that we hold.'");
        quest::signalwith(223111, 1012, 2000);
    }
    if($signal == 1012) {
        quest::ze(15,"Fennin Ro says, 'Calm yourselves, you need to appreciate the situation that is at hand.'");
        quest::signalwith(223111, 1013, 2000);
    }
    if($signal == 1013) {
        quest::ze(15,"Xegony says, 'Please listen to reason, we are doing what we must. The mortals possess a direct tie to Zebuxoruk. If his stasis is finished their link will dwindle as well as their powers and knowledge.");
        quest::signalwith(223111, 1014, 2000);
    }
    if($signal == 1014) {
        quest::ze(15,"Rathe says, 'The knowledge that was given to them by Zebuxoruk will fade from their minds. We must do this now, for if they were able to translate the divine language all existence would unravel. The balance of power in the universe would be destroyed.'");
        quest::signalwith(223111, 1015, 2000);
    }
    if($signal == 1015) {
        quest::ze(15,"Solusek Ro says, 'This is exactly the point that I am making! So you agree we must show them now that we are the power above them, and not to be questioned!'");
        quest::signalwith(223111, 1016, 2000);
    }
    if($signal == 1016) {
        quest::ze(15,"Rallos Zek says, 'You must see what he refers to; we must turn to Norrath and show them our power. What they are trying to accomplish cannot be allowed to come to pass.'");
        quest::signalwith(223111, 1017, 2000);
    }
    if($signal == 1017) {
        quest::ze(15,"Fennin Ro says, 'My son, please understand we must stop this advancement of mortals without halting their existence. The balance of power must be maintained. Without the mortals the balance would fade.'");
        quest::signalwith(223111, 1018, 2000);
    }
    if($signal == 1018) {
        quest::ze(15,"Solusek Ro syas, 'So they have made your decision for you too father. You are all wrong, this will only bring them further into our realms seeking answers! We must take action now. Have at your foolish games, I will not allow them to obtain my power.'");
        quest::signalwith(223111, 1019, 2000);
    }
    if($signal == 1019) {
        quest::ze(15,"You look up and see a meteor burning through the sky; Solusek returning to his tower to brood over the matters at hand.");
        quest::signalwith(223111, 1020, 2000);
    }
    if($signal == 1020) {
        quest::ze(15,"Rallos lets out a sigh of frustration that vibrates the ground at your feet.");
        quest::signalwith(223111, 1021, 2000);
    }
    if($signal == 1021) {
        quest::ze(15,"Rathe says, 'Rallos still your warring heart. This is what must be done. We must place him in a stasis from which he will not be released. Come share your power. We must commence now.'");
        quest::signalwith(223111, 1022, 2000);
    }
    if($signal == 1022) {
        quest::ze(15,"Xegony says, 'Mithaniel, Karana please record what you see here. With your good nature I am sure that your records will be impartial to any side. We must record this for the ages and learn from our mistake of allowing Zebuxoruk to gain so much power that he is easily passed on to mortals.'");
        quest::signalwith(223111, 1023, 2000);
    }
    if($signal == 1023) {
        quest::ze(15,"With a sudden jolt the wall comes into crystal clear focus.");
    }

    if($signal == 1002) {
		quest::ze(15,"Ethereal mists gather at the far wall, causing it to fade in and out of focus.");
        quest::signalwith(223111, 1024, 2000);
	}
    if($signal == 1024) {
        quest::ze(15,"A bright aura streaks through the sky. The power of it sends a surge through your body that makes your hair stand on end.");
        quest::signalwith(223111, 1025, 2000);
    }
    if($signal == 1025) {
        quest::ze(15,"The Triumvirate of Water speaks as one voice. It says, 'Now step up tot he chambers. Give a part of yourselves to the bind on Zebuxoruk. Through our power, the bonds on him will never be broken. He will be eternally placed in stasis.'");
        quest::signalwith(223111, 1026, 2000);
    }
    if($signal == 1026) {
        quest::ze(15,"Saryrn says, 'What of our weakened state. I refuse to return to my realm without the power to rule over my minions.'");
        quest::signalwith(223111, 1027, 2000);
    }
    if($signal == 1027) {
        quest::ze(15,"Xegony says, 'Terris Thule says, 'Yes, how can I spread my touch over my lands if I lack so much of myself?'");
        quest::signalwith(223111, 1028, 2000);
    }
    if($signal == 1028) {
        quest::ze(15,"Cazic Thule says, 'Do not worry daughter, we shall stay here until we are able to recover our strength.'");
        quest::signalwith(223111, 1029, 2000);
    }
    if($signal == 1029) {
        quest::ze(15,"Rallos Zek says, 'Our armies shall serve us as we regenerate our abilities. We have nothing to fear.'");
        quest::signalwith(223111, 1030, 2000);
    }
    if($signal == 1030) {
        quest::ze(15,"Bertoxxulous says, 'My soldiers of pestilence shall watch over us. Let us return to our chambers now.'");
        quest::signalwith(223111, 1031, 2000);
    }
    if($signal == 1031) {
        quest::ze(15,"Innoruuk says, 'Are you enjoying watching this Hammer of the Tribunal? I hope your petty report will show my disdain for the Tribunal having no hand in this.'");
        quest::signalwith(223111, 1032, 2000);
    }
    if($signal == 1032) {
        quest::ze(15,"The Seventh Hammer says, 'Do not waste your energy Innoruuk. You know they are eternally preoccupied with their trials. Surely even you understand many of these trials exist because of the hate you instill into the population of Norrath.'");
        quest::signalwith(223111, 1033, 2000);
    }
    if($signal == 1033) {
        quest::ze(15,"Innoruuk says, 'Do not mock me! I shall seek you out after this is done and my power is restored. You will not be so smug after our next meeting.'");
        quest::signalwith(223111, 1034, 2000);
    }
    if($signal == 1034) {
        quest::ze(15,"With a sudden jolt the wall comes into crystal clear focus.");
    }

    if($signal == 1003) {
		quest::ze(15,"Terris Thule says, 'I am certain my warriors will have no problem holding back any intruders, but I have my doubts about the other armies.'");
        quest::signalwith(223111, 1035, 2000);
	}
    if($signal == 1035) {
        quest::ze(15,"Vallon Zek says, 'Surely you jest. Your armies are better than the regiments from our realm?'");
        quest::signalwith(223111, 1036, 2000);
    }
    if($signal == 1036) {
        quest::ze(15,"Tallon Zek says, 'There is no question that our warriors of War and Tactics will be the backbone of the army.'");
        quest::signalwith(223111, 1037, 2000);
    }
    if($signal == 1037) {
        quest::ze(15,"Saryrn says, 'It is no matter anyways, no mortal could ever ascend to this place. These precautions are unnecessary. Bringing them here was a waste of time.'");
        quest::signalwith(223111, 1038, 2000);
    }
    if($signal == 1038) {
        quest::ze(15,"With a sudden jolt the wall comes into crystal clear focus.");
    }

    if($signal == 1004) {
		quest::ze(15,"Rallos Zek says, 'Something is wrong. I feel Tallon and Vallon's spirits have weakened.'");
        quest::signalwith(223111, 1039, 2000);
	}
    if($signal == 1039) {
        quest::ze(15,"Innoruuk says, 'Don't be a fool, that is just from giving a part of themselves to the bond on Zebuxoruk.'");
        quest::signalwith(223111, 1040, 2000);
    }
    if($signal == 1040) {
        quest::ze(15,"Cazic Thule says, 'No. It is more than that, I can feel the force of Terris has been drained as well.'");
        quest::signalwith(223111, 1041, 2000);
    }
    if($signal == 1041) {
        quest::ze(15,"Bertoxxulous says, 'This is not possible, could mortals have reached us here? Call in our armies, we are too weak to fight now.'");
        quest::signalwith(223111, 1042, 2000);
    }
    if($signal == 1042) {
        quest::ze(15,"Innoruuk says, 'You are all incompetent! I knew you all could not be trusted. If we are defeated in our weakened state, I do not know if we will be able to coalesce again. I will never forgive you all for what has transpired today!'");
        quest::signalwith(223111, 1043, 2000);
    }
    if($signal == 1043) {
        quest::ze(15,"Rallos Zek says, 'Now is not the time to bicker! We must focus our strength on these puny mortals! Minions of the army, come to our sides. Your gods beckon you, we need you now!'");
        quest::signalwith(223111, 1044, 2000);
    }
    if($signal == 1044) {
        quest::ze(15,"With a sudden jolt the wall comes into crystal clear focus.");
    }

    if($signal == 1005) {
		quest::ze(15,"Fennin Ro says, 'Impossible! How could the races of Norrath have traveled this deep into the Planes?!'");
        quest::signalwith(223111, 1045, 2000);
	}
    if($signal == 1045) {
        quest::ze(15,"Xegony says, 'I regret that it has come to this. They leave us with little choice, however. We must fuse our powers together. Separately we are weakened, together we will halt their advances.'");
        quest::signalwith(223111, 1046, 2000);
    }
    if($signal == 1045) {
        quest::ze(15,"Triumvirate of Water says, 'Unfortunate as it may be, I agree. We must call upon the beast we swore would never be needed.'");
        quest::signalwith(223111, 1047, 2000);
    }
    if($signal == 1045) {
        quest::ze(15,"The Rathe says, 'Then let us begin. Let our abilities and powers meld into one. It shall be our final protector and savior. The only thing standing between us and non-existence'");
        quest::signalwith(223111, 1048, 2000);
    }
    if($signal == 1045) {
        quest::ze(15,"Your head pounds from the amount of raw energy that begins to coalesce throughout the plane. Bright flashes of red, blue, green, and brown begin to come into focus on one single point. A large towering beast begins to manifest itself.");
        quest::ze(15,"A horrible creation with all the powers from each elemental realm. Your body begins to shudder by the mere presence of this being.");
        quest::signalwith(223111, 1049, 2000);
    }
    if($signal == 1045) {
        quest::ze(15,"With a sudden jolt the wall comes into crystal clear focus.");
    }

    if($signal == 1006) {
		quest::ze(15,"Suddenly in a bright flash a feminine figure appears before you. Your ears ring from the loud burst as she slowly materializes.");
	}
}

