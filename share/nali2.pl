while ($line=<>) {
    $line =~ s/((?:[0-2]?[0-9]{1,2}\.){3}[0-2]?[0-9]{1,2})/ip2r($1)/eg;
    print $line;
}
sub ip2r {
    my $ip=$_[0];

    my $addr;
    $addr=`ip2rnali $ip`;

    $addr =~ s/\n//g;
    $addr =~ s/\|//g;
    $addr =~ s/0//g;
    return "$ip\ <$addr\> ";
}
