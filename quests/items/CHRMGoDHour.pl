#This charm gains power the closer it is until midnight.


my %scale = (
            0 => 1.0,
            1 => 1.0,
            2 => 1.0,
            3 => 0.9,
            4 => 0.8,
            5 => 0.7,
            6 => 0.6,
            7 => 0.5,
            8 => 0.4,
            9 => 0.3,
            10 => 0.2,
            11 => 0.1,
            12 => 0.1,
            13 => 0.2,
            14 => 0.3,
            15 => 0.4,
            16 => 0.5,
            17 => 0.6,
            18 => 0.7,
            19 => 0.8,
            20 => 0.9,
            21 => 1.0,
            22 => 1.0,
            23 => 1.0
            );

sub EVENT_SCALE_CALC {
    $questitem->SetScale($scale{$zonehour});
}

