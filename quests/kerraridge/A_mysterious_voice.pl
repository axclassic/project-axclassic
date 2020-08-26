sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 150, $x + 150, $y - 150, $y + 150);
}
sub EVENT_ENTER {
    my $rand5 = int(rand(100));
    if ($rand5 <= 15 && $ulevel >= 15 && !defined $qglobals{"Messenger"}) {
        $client->Message(15,"A mysterious voice whispers to you, 'Vlarha Myticla in the tavern near the water has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
    }
} 
