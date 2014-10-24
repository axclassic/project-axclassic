sub EVENT_DEATH {
quest::spawn2(341083,0,0,-1311.1,-1263.6,-93.8,6.8);
quest::signalwith(341082,541,0);
$client->CameraEffect(3000, 3);
     $client->Message(14,"The ground shakes slightly, and a loud crack and thud can be heard echoing through the tunnels.");
}