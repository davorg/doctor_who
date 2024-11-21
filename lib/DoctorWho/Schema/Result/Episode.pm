use utf8;
package DoctorWho::Schema::Result::Episode;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DoctorWho::Schema::Result::Episode

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<episode>

=cut

__PACKAGE__->table("episode");

=head1 ACCESSORS

=head2 episode_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 story_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 episode_number_in_story

  data_type: 'integer'
  is_nullable: 0

=head2 title

  data_type: 'text'
  is_nullable: 1

=head2 air_date

  data_type: 'date'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "episode_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "story_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "episode_number_in_story",
  { data_type => "integer", is_nullable => 0 },
  "title",
  { data_type => "text", is_nullable => 1 },
  "air_date",
  { data_type => "date", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</episode_id>

=back

=cut

__PACKAGE__->set_primary_key("episode_id");

=head1 RELATIONS

=head2 story

Type: belongs_to

Related object: L<DoctorWho::Schema::Result::Story>

=cut

__PACKAGE__->belongs_to(
  "story",
  "DoctorWho::Schema::Result::Story",
  { story_id => "story_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2024-11-21 14:58:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:14zKX2Hm1HPp2JdszFmBVg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
