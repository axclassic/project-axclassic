sub EVENT_DEATH {
quest::spawn2(341083,0,0,-1810.7,-1808.9,-170.9,184.1);
quest::signalwith(341082,541,0);
$client->CameraEffect(3000, 3);
     $client->Message(14,"The ground shakes slightly, and a loud crack and thud can be heard echoing through the tunnels.");
}