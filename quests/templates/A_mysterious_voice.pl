 sub EVENT_SPAWN {
     $x = $npc->GetX();
     $y = $npc->GetY();
     quest::set_proximity($x - 150, $x + 150, $y - 150, $y + 150);
}
sub EVENT_ENTER {
  my $rand5 = int(rand(100));
  if ($rand5 <= 20 && $ulevel >= 15 && !defined $qglobals{"Messenger"}) {
	if($zoneid == 55) { #Akanon
	  $client->Message(15,"A mysterious voice whispers to you, 'Fla[ti Bizttrin in the Clockwork Bar has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 106) { #cabeast
	  $client->Message(15,"A mysterious voice whispers to you, 'Zauz Malgorne was last seen near the Klok brothers smithing area and has just joined the Wayfarers Brotherhood. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 82) { #cabwest
        $client->Message(15,"A mysterious voice whispers to you, 'Yzilimn Pxikn has just joined the Wayfarers Brotherhood. He is near Aediles Thrall. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 61) { #felwitha
        $client->Message(15,"A mysterious voice whispers to you, 'Larroniae Huial has just joined the Wayfarers Brotherhood. He may be found inside the Shop of All Holos. She has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 62) { #felwithb
        $client->Message(15,"A mysterious voice whispers to you, 'Thwinose Vilgarn has just joined the Wayfarers Brotherhood. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 10) { #freporte
        $client->Message(15,"A mysterious voice whispers to you, 'Miocaei Herlsas has just joined the Wayfarers Brotherhood. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 8) { freportn
        $client->Message(15,"A mysterious voice whispers to you, 'Genniau Noghce has just joined the Wayfarers Brotherhood. She is in Tassel's Tavern . She has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 54) { #gfaydark
        $client->Message(15,"A mysterious voice whispers to you, 'Enyaanuia Windancer has just joined the Wayfarers Brotherhood. She may be in the tavern near Trueshots Bows. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 52) { #grobb
        $client->Message(15,"A mysterious voice whispers to you, 'Blorgok Gkapbron has just joined the Wayfarers Brotherhood. He may be in the Berserker GM area. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 29) { #halas
        $client->Message(15,"A mysterious voice whispers to you, 'Jowra McGynnall has just joined the Wayfarers Brotherhood. She may be in McDaniels Smokes and Spirits. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 60) { #kaladima
        $client->Message(15,"A mysterious voice whispers to you, 'Kennelia Gwieal has just joined the Wayfarers Brotherhood. She may be found in the Pub Kal. She has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 67) { #kaladimb
        $client->Message(15,"A mysterious voice whispers to you, 'Halthar Mowestone has just joined the Wayfarers Brotherhood. He may be found near the Everhot Forge. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 74) { #kerraridge
        $client->Message(15,"A mysterious voice whispers to you, 'Vlarha Myticla in the tavern near the water has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 41) { #neriakb
        $client->Message(15,"A mysterious voice whispers to you, 'Kwilrz Vn`Ycxa has just joined the Wayfarers Brotherhood. He may be found in The Refined Palate. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 42) { #neriakc
        $client->Message(15,"A mysterious voice whispers to you, 'Torxal Smalane has just joined the Wayfarers Brotherhood. He may be found near the Furrier Royale. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 49) { #oggok
        $client->Message(15,"A mysterious voice whispers to you, 'Puwdap has just joined the Wayfarers Brotherhood. She may be found in one of the finger tunnels to the west. She has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 75) { #paineel
        $client->Message(15,"A mysterious voice whispers to you, 'Yenlr Undraie has just joined the Wayfarers Brotherhood. She may be found in the courtyard as you leave the elevator rooms. She has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 45) { #qcat
        $client->Message(15,"A mysterious voice whispers to you, 'Dollin Nusmag has just joined the Wayfarers Brotherhood. He may be found in the Cleric GM area. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 12) { #qeywhh1
        $client->Message(15,"A mysterious voice whispers to you, 'Melaara Tenwinds has just joined the Wayfarers Brotherhood. Look for her in the southeast corner . She has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 1) { #qeynos
        $client->Message(15,"A mysterious voice whispers to you, 'Warehnn Awlne has just joined the Wayfarers Brotherhood. He may be found in the Mermaid's Lure. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 2) { #qeynos2
        $client->Message(15,"A mysterious voice whispers to you, 'Drun Vorwig has just joined the Wayfarers Brotherhood. He may be found just inside the Qeynos gates. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 3) { #qrg
        $client->Message(15,"A mysterious voice whispers to you, 'Narwkend Falgon has just joined the Wayfarers Brotherhood. He is in the building near Ranger Band. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 50) { #rathemtn
        $client->Message(15,"A mysterious voice whispers to you, 'Nemeen Pekasr has just joined the Wayfarers Brotherhood. He may be near the wagons near Cynthia. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 19) { #rivervale
        $client->Message(15,"A mysterious voice whispers to you, 'Jimbledrop Heptybak has just joined the Wayfarers Brotherhood, he can be found accros the bridge in a small residence. He has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
	elsif($zoneid == 83) { #swampofnohope
        $client->Message(15,"A mysterious voice whispers to you, 'Fipnoc Birribit has just joined the Wayfarers Brotherhood. He may be where brewing supplies are sold. He has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
	}
  }
} 
