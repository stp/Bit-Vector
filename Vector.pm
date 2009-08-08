
###############################################################################
##                                                                           ##
##    Copyright (c) 1995 - 2009 by Steffen Beyer.                            ##
##    All rights reserved.                                                   ##
##                                                                           ##
##    This package is free software; you can redistribute it                 ##
##    and/or modify it under the same terms as Perl itself.                  ##
##                                                                           ##
###############################################################################

package Bit::Vector;

use strict;
use vars qw(@ISA @EXPORT @EXPORT_OK $VERSION @CONFIG);

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);

@EXPORT = qw();

@EXPORT_OK = qw();

$VERSION = '6.7';

bootstrap Bit::Vector $VERSION;

sub STORABLE_freeze
{
    my($self, $clone) = @_;
    return( Storable::freeze( [ $self->Size(), $self->Block_Read() ] ) );
}

sub STORABLE_attach
{
    my($class, $clone, $string) = @_;
    my($size,$buffer) = @{ Storable::thaw($string) };
    my $self = Bit::Vector->new($size);
    $self->Block_Store($buffer);
    return $self;
}

1;

__END__

