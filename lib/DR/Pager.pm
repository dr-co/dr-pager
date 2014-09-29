use strict;
use warnings;
use utf8;

package DR::Pager;
use base 'Data::Page';

our $VERSION = '0.1';

sub offset {
    return ($_[0]->_current_page_accessor - 1) *
            $_[0]->_entries_per_page_accessor;
}

sub limit {
    return $_[0]->_entries_per_page_accessor;
}

=head2 pages_per_set

Размер окна пейджера.

=cut

sub pages_per_set {
    my ($self, $value) = @_;
    return $self->{pages_per_set} unless defined $value;
    return $self->{pages_per_set} = $value;
}

=head2 slider

Если параметр установлен то пейджер не пердназначен для
работы с общим количеством строк, а только с заданным набором.

=cut

sub slider {
    my ($self, $value) = @_;
    return $self->{slider} unless defined $value;
    return $self->{slider} = $value;
}

1;
__END__

=head1 NAME

DR::Pager - low level functions for Data::Page

=head1 SYNOPSIS

    use DR::Pager;

    my $pager = DR::Pager->new;
    $pager->entries_per_page( $rows );
    $pager->current_page( $page );

    # use limit and offset
    dbh->select( ... , $pager->limit, $pager->offset);

    # get count
    $count = dbh->select(...);

    # set count
    $pager->total_entries( $count );


    template->render( $pager );

=head1 DESCRIPTION

This module allows you use Data::Page without first set of total_entries. This
mostly need for post get count queries (when you use cursors or calc_num_rows).

=head1 AUTHORS

Dmitry E. Oboukhov <unera@debian.org>,
Roman V. Nikolaev <rshadow@rambler.ru>

=head1 COPYRIGHT

Copyright (C) 2011 Dmitry E. Oboukhov <unera@debian.org>
Copyright (C) 2011 Roman V. Nikolaev <rshadow@rambler.ru>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.

=cut
