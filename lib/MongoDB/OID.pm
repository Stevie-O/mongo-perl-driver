package MongoDB::OID;
# ABSTRACT: A Mongo Object ID

use Any::Moose;

=attr value

The OID value. A random value will be generated if none exists already.

=cut

has value => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    builder => '_build_value',
);


sub to_string {
    my ($self) = @_;
    $self->_build_value;
}

use overload '""' => \&to_string;

no Any::Moose;
__PACKAGE__->meta->make_immutable;

1;
